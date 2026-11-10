#!/usr/bin/env python3
"""
Render an openEHR template (Web Template .json or OPT, plus its source
.adl archetypes) as a markmap mind map, with slot fills grouped under their
slot.

  python scripts/FilesetToMarkmap.py           # <repo>/input -> <repo>/temp/markmap_<timestamp>.md
  python scripts/FilesetToMarkmap.py --html    # also build input/images/template-mindmap.html

Each node shows its name, occurrences, data type or archetype id, and its
description on hover. A DV_CODED_TEXT links to its value set's section on
the IG's terminology page (a single allowed code goes inline). The HTML
page also has an indented tree view of the same nodes (<page>#tree), and
its JavaScript goes into <page>.js next to it.

Why the source archetypes are needed: a template is flattened, and
flattening deletes the ARCHETYPE_SLOT node once it's filled -- the filling
archetypes survive only as plain siblings, indistinguishable from a fixed
archetype reference, and the slot's own name is lost. The source .adl files
still have the `allow_archetype` declarations: at-code, name (in every
translated language), and the `include`/`exclude` archetype_id regexes.
This script parses those, and while walking the template tests each
filler's archetype id against the slots declared at that position. Fillers
that satisfy the same slot are grouped under a header named after it -- even
when they are different archetypes.

Input can be (default: <repo>/input, i.e. input/templates + input/archetypes,
plus any other .adl under input/):
  * a fileset .zip (extracted to a temp dir and cleaned up after)
  * a fileset directory with templates/ and archetypes/ subfolders; the
    template may be a Web Template .json (its aqlPaths carry the slot
    positions) or an .opt
  * a bare .opt or Web Template .json, with --archetypes pointing at its
    archetype sources

Requirements: Python 3.9+ (standard library only); --html also needs
Node.js (npx), which fetches markmap-cli on first use.
"""

import argparse
import glob
import html
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET
import zipfile
from datetime import datetime

# The script lives in <repo>/scripts; all defaults are relative to <repo>.
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEFAULT_INPUT = os.path.join(REPO_ROOT, "input")
DEFAULT_OUTPUT_DIR = os.path.join(REPO_ROOT, "temp")
DEFAULT_HTML = os.path.join(REPO_ROOT, "input", "images", "template-mindmap.html")
DEFAULT_TERMINOLOGY = os.path.join(REPO_ROOT, "input", "pagecontent", "terminology.md")
MARKMAP_CLI_VERSION = "0.18.12"

XSI_TYPE = "{http://www.w3.org/2001/XMLSchema-instance}type"

# ----------------------------------------------------------------- styling --
# One colour for the whole map: badges, slot headers and markmap's branches.
COLOUR = "#0277bd"


def badge(name, colour, dashed=False):
    border = f"1px {'dashed' if dashed else 'solid'} {colour}"
    return (f'<span style="border:{border};border-radius:3px;'
            f'padding:0 5px;color:{colour};font-weight:600">{name}</span>')


def muted(text, size="0.8em"):
    return f'<span style="color:#78909c;font-size:{size}">{text}</span>'


def with_tooltip(label, description):
    """Wrap a node label so hovering it shows `description` (the browser's
    native title tooltip -- plain text, newlines kept)."""
    if not description:
        return label
    tip = html.escape(description.strip(), quote=True).replace("\n", "&#10;")
    return f'<span title="{tip}">{label}</span>'


PASSTHROUGH = {"ITEM_TREE", "ITEM_LIST", "ITEM_TABLE", "ITEM_SINGLE",
               "ITEM_STRUCTURE"}


def local(elem):
    return elem.tag.rsplit("}", 1)[-1]


def kids(elem, name):
    return [c for c in elem if local(c) == name]


def child_text(elem, name, default=""):
    for c in elem:
        if local(c) == name:
            return (c.text or "").strip()
    return default


def occurrences(obj):
    occ = next((c for c in obj if local(c) == "occurrences"), None)
    if occ is None:
        return None
    lower = child_text(occ, "lower", "0")
    if child_text(occ, "upper_unbounded") == "true":
        upper = "*"
    else:
        upper = child_text(occ, "upper", lower)
    return f"{lower}..{upper}"


def is_excluded(obj):
    return occurrences(obj) == "0..0"


def rm_class(obj):
    return child_text(obj, "rm_type_name")


def archetype_id(obj):
    node = next((c for c in obj if local(c) == "archetype_id"), None)
    return child_text(node, "value") if node is not None else ""


def short_archetype_id(arch):
    if arch.startswith("openEHR-EHR-"):
        return arch[len("openEHR-EHR-"):]
    if arch.startswith("openEHR-"):
        return arch[len("openEHR-"):]
    return arch


def archetype_concept_name(arch):
    """Fallback when no source archetype is available for a slot's own
    term: openEHR-EHR-CLUSTER.therapeutic_direction.v1 -> Therapeutic direction"""
    parts = short_archetype_id(arch).split(".")
    concept = parts[-2] if len(parts) >= 2 else parts[0]
    return concept.replace("_", " ").capitalize()


def term_map(obj):
    """{node_id: {"text": ..., "description": ...}} from a C_ARCHETYPE_ROOT's
    term_definitions as embedded directly in the OPT (ordinary node names --
    unaffected by the slot-name problem this script exists to fix)."""
    terms = {}
    for td in kids(obj, "term_definitions"):
        code = td.get("code")
        if not code:
            continue
        for item in kids(td, "items"):
            if item.get("id") in ("text", "description"):
                terms.setdefault(code, {})[item.get("id")] = (item.text or "").strip()
    return terms


def element_datatype(obj):
    for attr in kids(obj, "attributes"):
        if child_text(attr, "rm_attribute_name") == "value":
            for child in kids(attr, "children"):
                xt = child.get(XSI_TYPE, "")
                dt = rm_class(child) or xt.split(":")[-1].removeprefix("C_")
                if dt:
                    return dt
    return ""


def label_for(obj, terms, opts, value_set=None):
    xsi = obj.get(XSI_TYPE, "").split(":")[-1]
    rm = rm_class(obj)
    node_id = child_text(obj, "node_id")
    arch = archetype_id(obj)

    term = terms.get(node_id) or {}
    name = term.get("text") or ""
    if not name and arch:
        name = archetype_concept_name(arch)
    if not name:
        name = rm or xsi

    dt = element_datatype(obj) if rm == "ELEMENT" else ""
    return render_label(name, rm, arch, xsi == "ARCHETYPE_SLOT",
                        occurrences(obj), dt, opts, term.get("description"),
                        value_set)


def render_label(name, rm, arch, is_slot, occ, dt, opts, description="",
                 value_set=None):
    parts = []
    if opts.node_style == "badge" and (arch or is_slot):
        parts.append(badge(name, COLOUR, dashed=is_slot))
    elif opts.node_style == "bold" and (arch or is_slot):
        parts.append(f"**{name}**")
    else:
        parts.append(name)

    # Occurrences, data types and archetype ids each go in a span with a
    # class from DETAILS, so the HTML page can hide them (with their <br/>;
    # the IG Publisher checks pages as XHTML, so every tag is closed).
    if occ:
        parts.append(f'<span class="mm-occ">`{occ}`</span>')
    if rm == "ELEMENT" and opts.datatypes and dt:
        # A choice of more than two types (e.g. "Condition": seven) goes on
        # its own lines, three types per line, so the node stays narrow.
        types = [html.escape(t) for t in dt.split(" | ")]
        rows = [types] if len(types) <= 2 else \
            [types[i:i + 3] for i in range(0, len(types), 3)]
        texts = []
        for i, row in enumerate(rows):
            text = " | ".join(row) + (" |" if i < len(rows) - 1 else "")
            text = muted(text) if opts.node_style == "badge" else f"<sub>{text}</sub>"
            texts.append(text if len(types) <= 2 else "<br/>" + text)
        parts.append(f'<span class="mm-dt">{" ".join(texts)}</span>')
    if arch and opts.archetype_ids:
        # Always on its own line: name + occurrences + id is often too long
        # for one line, and an explicit break keeps the node box as wide as
        # its longest line (see maxWidth in main()).
        sid = short_archetype_id(arch)
        parts.append('<span class="mm-arch"><br/>'
                     + (muted(sid) if opts.node_style == "badge"
                        else f"<sub>{sid}</sub>") + "</span>")
    if is_slot and opts.node_style != "badge":
        parts.append("*(open slot)*")
    if value_set and len(value_set["codes"]) == 1:
        parts.append("= " + code_entry(value_set["codes"][0]))
    elif value_set:
        # On its own line, like the archetype id: a link to the list.
        parts.append(f'<span class="mm-vs"><br/>{value_set_link(value_set, opts)}</span>')
    return with_tooltip(" ".join(parts), description)


# -------------------------------------------------------------- value sets --
# A DV_CODED_TEXT's allowed codes, as {"terminology", "codes": [(code,
# label, description)], "default", "key"}; key is the node's id (Web
# Template) or name (OPT). One code goes inline in the node's own label.
# Longer lists (and external terminologies with no list) are not repeated
# in the map: the node links to the section of the terminology page that
# lists them, in a new tab.

def code_entry(code_tuple):
    code, label, _desc = code_tuple
    return f"`{code}` {label}".rstrip()


def heading_slug(text):
    """The id kramdown gives a heading ("SNOMED CT" -> "snomed-ct")."""
    text = re.sub(r"[^a-z0-9\s-]", "", text.lower())
    return re.sub(r"\s+", "-", text.strip())


def load_headings(md_path):
    """Heading ids of the terminology page, in page order."""
    if not md_path or not os.path.isfile(md_path):
        return []
    with open(md_path, encoding="utf-8") as fh:
        return [heading_slug(m.group(1))
                for m in re.finditer(r"^#+\s+(.+?)\s*$", fh.read(), re.M)]


def value_set_anchor(value_set, headings):
    """The section for a value set: a heading containing the node's id
    ("route" -> route-of-administration), else the first heading starting
    with the terminology's name (EDQM, local, openEHR, SNOMED CT)."""
    key = f"-{heading_slug(value_set['key'].replace('_', ' '))}-"
    terminology = heading_slug(value_set["terminology"].replace("-", " "))
    for slug in headings:
        if key != "--" and key in f"-{slug}-":
            return slug
    for slug in headings:
        if slug.split("-")[0] == terminology.split("-")[0]:
            return slug
    return ""


def value_set_link(value_set, opts):
    codes = value_set["codes"]
    text = f"Value set · {html.escape(value_set['terminology'])} · " \
        + (f"{len(codes)} codes" if codes else "external")
    if not opts.terminology_page:
        return muted(text)
    href = opts.terminology_page
    anchor = value_set_anchor(value_set, opts.terminology_headings)
    if anchor:
        href += "#" + anchor
    return (f'<a href="{href}" target="_blank" rel="noopener" '
            f'style="color:{COLOUR};font-size:0.8em">{text} ↗</a>')


def opt_value_set(obj, terms):
    """Value set of an OPT ELEMENT whose value is a DV_CODED_TEXT."""
    if rm_class(obj) != "ELEMENT":
        return None
    for attr in kids(obj, "attributes"):
        if child_text(attr, "rm_attribute_name") != "value":
            continue
        for cp in attr.iter():
            if cp.get(XSI_TYPE, "").split(":")[-1] != "C_CODE_PHRASE":
                continue
            tid = next((c for c in cp if local(c) == "terminology_id"), None)
            terminology = child_text(tid, "value") if tid is not None else ""
            codes = []
            for c in kids(cp, "code_list"):
                code = (c.text or "").strip()
                term = terms.get(code, {}) if terminology == "local" else {}
                codes.append((code, term.get("text", ""), term.get("description", "")))
            assumed = next((c for c in cp if local(c) == "assumed_value"), None)
            default = child_text(assumed, "code_string") if assumed is not None else None
            if codes or terminology:
                name = terms.get(child_text(obj, "node_id"), {}).get("text", "")
                return {"terminology": terminology or "local", "codes": codes,
                        "default": default, "key": name}
    return None


def wt_value_set(node, opts):
    """Value set of a Web Template DV_CODED_TEXT node."""
    if node["rmType"] != "DV_CODED_TEXT":
        return None
    for inp in node.get("inputs", []):
        if inp.get("type") != "CODED_TEXT":
            continue
        codes = []
        for item in inp.get("list", []):
            label = (item.get("localizedLabels") or {}).get(opts.lang) \
                or item.get("label", "")
            descs = item.get("localizedDescriptions") or {}
            codes.append((item["value"], label,
                          descs.get(opts.lang) or descs.get("en") or ""))
        if codes or inp.get("terminology"):
            return {"terminology": inp.get("terminology") or "local",
                    "codes": codes, "default": inp.get("defaultValue"),
                    "key": node.get("id", "")}
    return None


def slot_header_label(name, count, opts, description=""):
    parts = []
    if opts.node_style == "badge":
        parts.append(badge(name, COLOUR, dashed=True))
    elif opts.node_style == "bold":
        parts.append(f"*{name}*")
    else:
        parts.append(name)
    label = f"{count} alternatives"
    parts.append(muted(label) if opts.node_style == "badge" else f"<sub>{label}</sub>")
    return with_tooltip(" ".join(parts), description)


# --------------------------------------------------------- source archetypes --
# Best-effort ADL 1.4 (Cadl/dADL) parsing, scoped to exactly what's needed:
# the archetype's own id, its term_definitions (per language), and its
# allow_archetype SLOT declarations (at-code + include/exclude regexes).
# Not a full grammar -- brace/bracket matching that treats "..." strings,
# /.../ regex literals and -- comments as opaque so braces inside them don't
# throw the depth count off.

def extract_balanced(text, start, open_ch, close_ch):
    """Balanced open_ch/close_ch span starting at text[start].

    Treats "..." strings and -- line comments as opaque so brace-like chars
    inside them don't affect the depth count. Deliberately does NOT try to
    special-case /regex/ literals (an earlier version did, keyed off '/' --
    but archetype_id/value's own '/' path separator collided with that and
    desynced the count). None of the archetype_id regexes seen in practice
    use {n,m} quantifiers, so plain brace counting is correct here.
    """
    depth = 0
    i = start
    n = len(text)
    while i < n:
        c = text[i]
        if c == '"':
            i += 1
            while i < n and text[i] != '"':
                i += 2 if text[i] == "\\" else 1
            i += 1
            continue
        if c == "-" and i + 1 < n and text[i + 1] == "-":
            j = text.find("\n", i)
            i = n if j == -1 else j + 1
            continue
        if c == open_ch:
            depth += 1
        elif c == close_ch:
            depth -= 1
            if depth == 0:
                return text[start:i + 1], i + 1
        i += 1
    return text[start:], n


LANG_KEY_RE = re.compile(r'\["([a-zA-Z][a-zA-Z-]*)"\]\s*=\s*<')
TERM_RE = re.compile(
    r'\["(id\d+(?:\.\d+)*|at\d+(?:\.\d+)*)"\]\s*=\s*<\s*text\s*=\s*<"((?:[^"\\]|\\.)*)">'
    r'(?:\s*description\s*=\s*<"((?:[^"\\]|\\.)*)">)?')
SLOT_RE = re.compile(
    r'allow_archetype\s+\w+\[(id\d+(?:\.\d+)*|at\d+(?:\.\d+)*)\]'
    r'\s+occurrences\s+matches\s+\{[^{}]*\}\s+matches\s+(\{)')
INCLUDE_RE = re.compile(
    r'\binclude\b\s+archetype_id/value\s+matches\s+\{/((?:[^/\\]|\\.)*)/\}')
EXCLUDE_RE = re.compile(
    r'\bexclude\b\s+archetype_id/value\s+matches\s+\{/((?:[^/\\]|\\.)*)/\}')
HEADER_RE = re.compile(r'archetype\s*\([^)]*\)\s*\n\s*([\w.\-]+)')

# A single archetype can declare several `allow_archetype` slots that share
# an RM attribute name (e.g. two different "items" lists at different
# nesting depths) -- one of them is often a wide-open extension point
# (`archetype_id/value matches {/.*/}`). Matching a filler's id against
# every slot in the file regardless of position lets that wildcard slot
# swallow unrelated fillers. So each slot is scoped to (nearest enclosing
# object's own at-code, attribute name), found by counting braces backward
# from the `allow_archetype` token to its attribute opener and then to that
# attribute's own parent object opener.
ATTR_HEAD_RE = re.compile(
    r'(?<![\w./])([a-z_][a-zA-Z0-9_]*)\s+'
    r'(?:(?:existence|cardinality)\s+matches\s+\{[^{}]*\}\s+)*'
    r'matches\s*$')
OBJ_HEAD_RE = re.compile(
    r'(?:allow_archetype\s+)?([A-Z_]+)(?:\[(at\d+(?:\.\d+)*|id\d+(?:\.\d+)*)\])?'
    r'\s*(?:occurrences\s+matches\s+\{[^{}]*\}\s+)?matches\s*$')


def find_enclosing_open_brace(text, pos):
    """Index of the '{' that most tightly encloses position `pos`, found by
    counting braces backward. Best-effort: doesn't skip string/regex/comment
    spans on the way back, but those rarely contain literal braces here."""
    depth = 0
    i = pos - 1
    while i >= 0:
        c = text[i]
        if c == "}":
            depth += 1
        elif c == "{":
            if depth == 0:
                return i
            depth -= 1
        i -= 1
    return None


def enclosing_context(text, slot_pos):
    """(parent_object_key, attr_name) for the allow_archetype at slot_pos."""
    attr_brace = find_enclosing_open_brace(text, slot_pos)
    if attr_brace is None:
        return (None, None)
    m = ATTR_HEAD_RE.search(text[max(0, attr_brace - 300):attr_brace])
    if not m:
        return (None, None)
    attr_name = m.group(1)
    parent_brace = find_enclosing_open_brace(text, attr_brace)
    parent_key = None
    if parent_brace is not None:
        pm = OBJ_HEAD_RE.search(text[max(0, parent_brace - 300):parent_brace])
        if pm:
            parent_key = pm.group(2) or pm.group(1)
    return (parent_key, attr_name)


def parse_terms(text):
    m = re.search(r"term_definitions\s*=\s*(<)", text)
    if not m:
        return {}
    block, _ = extract_balanced(text, m.start(1), "<", ">")
    lang_positions = [(mo.group(1), mo.start()) for mo in LANG_KEY_RE.finditer(block)]
    terms = {}
    for idx, (lang, pos) in enumerate(lang_positions):
        end = lang_positions[idx + 1][1] if idx + 1 < len(lang_positions) else len(block)
        terms[lang] = {code: {"text": adl_unescape(text),
                              "description": adl_unescape(desc)}
                       for code, text, desc in TERM_RE.findall(block[pos:end])}
    return terms


def adl_unescape(s):
    return s.replace('\\"', '"').replace("\\\\", "\\")


def parse_slots(text):
    slots = []
    for m in SLOT_RE.finditer(text):
        at_code = m.group(1)
        body, _ = extract_balanced(text, m.start(2), "{", "}")
        includes = INCLUDE_RE.findall(body)
        excludes = EXCLUDE_RE.findall(body)
        if not includes:
            continue
        parent_key, attr_name = enclosing_context(text, m.start())
        slots.append((at_code, includes, excludes, parent_key, attr_name))
    return slots


class Archetype:
    def __init__(self, path):
        text = open(path, encoding="utf-8", errors="replace").read()
        m = HEADER_RE.search(text)
        self.id = m.group(1) if m else os.path.splitext(os.path.basename(path))[0]
        self.path = path
        self.terms = parse_terms(text)
        self.slots = parse_slots(text)

    def term(self, at_code, lang, field="text"):
        """`field` ("text" or "description") of at_code, in `lang` if the
        archetype has it, else English, else any language that does."""
        for l in [lang, "en", *self.terms]:
            value = ((self.terms.get(l) or {}).get(at_code) or {}).get(field)
            if value:
                return value
        return ""

    def slot_for(self, parent_key, attr_name, filler_archetype_id):
        """The at-code of the SLOT this filler satisfies, if any -- only
        considering slots declared under the same (parent object, attribute)
        position, so an unrelated wide-open slot elsewhere in the same
        archetype can't swallow this filler."""
        for at_code, includes, excludes, p_key, a_name in self.slots:
            if a_name != attr_name:
                continue
            if p_key is not None and parent_key is not None and p_key != parent_key:
                continue
            try:
                if any(re.search(rx, filler_archetype_id) for rx in includes) and \
                   not any(re.search(rx, filler_archetype_id) for rx in excludes):
                    return at_code
            except re.error:
                continue
        return None


def load_archetypes(directory, extra_root=None):
    """Source archetypes from `directory`, plus any other .adl found
    anywhere under `extra_root` (filesets don't always keep every archetype
    in Archetypes/). `directory` wins when an id appears twice."""
    paths = []
    if directory and os.path.isdir(directory):
        paths += glob.glob(os.path.join(directory, "*.adl"))
    if extra_root and os.path.isdir(extra_root):
        paths += glob.glob(os.path.join(extra_root, "**", "*.adl"), recursive=True)
    registry = {}
    for path in paths:
        try:
            arch = Archetype(path)
            registry.setdefault(arch.id, arch)
        except OSError:
            continue
    return registry


# ----------------------------------------------------------- fileset input --

def resolve_inputs(fileset_arg, archetypes_arg):
    """Returns (opt_path, archetypes_dir, cleanup_dir_or_None)."""
    path = fileset_arg
    cleanup = None
    if path.lower().endswith(".zip"):
        cleanup = tempfile.mkdtemp(prefix="fileset_")
        with zipfile.ZipFile(path) as zf:
            zf.extractall(cleanup)
        path = cleanup

    if os.path.isdir(path):
        templates_dir = subdir(path, "templates") or os.path.join(path, "templates")
        candidates = glob.glob(os.path.join(templates_dir, "*.opt")) \
            or [p for p in glob.glob(os.path.join(templates_dir, "*.json"))
                if is_web_template(p)] \
            or glob.glob(os.path.join(path, "**", "*.opt"), recursive=True) \
            or [p for p in glob.glob(os.path.join(path, "**", "*.json"), recursive=True)
                if is_web_template(p)]
        if not candidates:
            sys.exit(f"no .opt or Web Template .json found under {path}")
        if len(candidates) > 1:
            print(f"{len(candidates)} templates found, using {candidates[0]}",
                  file=sys.stderr)
        opt_path = candidates[0]
        archetypes_dir = archetypes_arg or subdir(path, "archetypes")
        if not archetypes_dir or not os.path.isdir(archetypes_dir):
            found = glob.glob(os.path.join(path, "**", "*.adl"), recursive=True)
            archetypes_dir = os.path.dirname(found[0]) if found else None
    else:
        if not (path.lower().endswith(".opt") or is_web_template(path)):
            sys.exit(f"{path} isn't an .opt file or a Web Template .json. "
                     "Pass the fileset .zip/directory, or an .opt / Web "
                     "Template path directly.")
        opt_path = path
        archetypes_dir = archetypes_arg or subdir(
            os.path.dirname(os.path.abspath(path)), "archetypes")

    return opt_path, archetypes_dir, cleanup


def subdir(parent, name):
    """parent/<name>, matched case-insensitively (filesets use Templates/
    and Archetypes/, this repo templates/ and archetypes/), or None."""
    try:
        entries = os.listdir(parent)
    except OSError:
        return None
    match = next((e for e in sorted(entries) if e.lower() == name.lower()
                  and os.path.isdir(os.path.join(parent, e))), None)
    return os.path.join(parent, match) if match else None


def is_web_template(path):
    if not path.lower().endswith(".json") or not os.path.isfile(path):
        return False
    try:
        with open(path, encoding="utf-8") as fh:
            data = json.load(fh)
    except (OSError, ValueError):
        return False
    return isinstance(data, dict) and "templateId" in data and "tree" in data


def guess_root_archetype(rm_type, registry):
    """The OPT's <definition> root has no archetype_id of its own -- find
    the one archetype in the registry that plausibly defines it."""
    candidates = [a for aid, a in registry.items()
                  if f"-{rm_type}." in aid or aid.split(".")[0].endswith(rm_type)]
    return candidates[0] if len(candidates) == 1 else None


# ------------------------------------------------------------------- walk --

def group_by_slot(children, arch, parent_key, attr_name):
    """Cluster consecutive children the owning archetype's own SLOT
    declarations say belong together -- using the filler's archetype id
    against the slot's include/exclude regex (scoped to this exact
    parent-object/attribute position), not a same-id guess."""
    groups = []
    for child in children:
        aid = archetype_id(child)
        slot_code = arch.slot_for(parent_key, attr_name, aid) if (arch and aid) else None
        if slot_code and groups and groups[-1][0] == slot_code:
            groups[-1][1].append(child)
        else:
            groups.append((slot_code, [child]))
    return groups


def is_unfilled_slot(obj):
    return obj.get(XSI_TYPE, "").split(":")[-1] == "ARCHETYPE_SLOT"


def walk(obj, terms, depth, out, opts, current_arch):
    if is_excluded(obj):
        opts.pruned += 1
        return
    if opts.omit_unfilled_slots and is_unfilled_slot(obj):
        opts.omitted_slots += 1
        return

    aid = archetype_id(obj)
    if aid:
        terms = {**terms, **term_map(obj)}
        next_arch = opts.archetypes.get(aid)
        if next_arch is None:
            opts.missing_sources.add(aid)
        current_arch = next_arch

    rm = rm_class(obj)
    passthrough = (rm in PASSTHROUGH and not opts.containers) \
        or (rm == "ITEM_TREE" and not opts.item_wrappers)
    if not passthrough:
        value_set = opt_value_set(obj, terms) if opts.value_sets else None
        out.append(f"{'  ' * depth}- {label_for(obj, terms, opts, value_set)}")
        depth += 1
        opts.emitted += 1

    for attr in kids(obj, "attributes"):
        attr_name = child_text(attr, "rm_attribute_name")
        if rm == "ELEMENT" and attr_name == "value" and not opts.containers:
            continue
        attr_depth = depth
        if opts.attributes and not (attr_name == "items" and not opts.item_wrappers):
            out.append(f"{'  ' * depth}- *{attr_name}*")
            attr_depth = depth + 1

        parent_key = child_text(obj, "node_id")
        children = kids(attr, "children")
        groups = group_by_slot(children, current_arch, parent_key, attr_name) \
            if opts.group_slots else [(None, [c]) for c in children]
        for slot_code, group in groups:
            if slot_code and len(group) > 1:
                name = current_arch.term(slot_code, opts.lang) \
                    or archetype_concept_name(archetype_id(group[0]))
                desc = current_arch.term(slot_code, opts.lang, "description")
                out.append(f"{'  ' * attr_depth}- "
                           f"{slot_header_label(name, len(group), opts, desc)}")
                opts.emitted += 1
                opts.grouped += 1
                group_depth = attr_depth + 1
            else:
                group_depth = attr_depth
            for child in group:
                walk(child, terms, group_depth, out, opts, current_arch)


# ------------------------------------------------------ web template walk --
# A Web Template is also flattened, but every node keeps its aqlPath -- and
# that path names the RM attribute and enclosing at-code for each child, so
# the same (parent object, attribute) scoped slot lookup still applies.
# ITEM_TREE wrappers and 0..0 nodes are already gone; ELEMENTs usually
# appear as their value node (rmType DV_*, aqlPath ending in /value).

AQL_SEGMENT_RE = re.compile(r"/([a-z_]+)(?:\[([^\],']+)(?:,'[^']*')?\])?")


def wt_occurrences(node):
    if "min" not in node:
        return None
    upper = "*" if node.get("max", -1) == -1 else node["max"]
    return f"{node['min']}..{upper}"


def wt_position(node):
    """(parent_key, attr_name) for a node, from the tail of its aqlPath --
    the same key the ADL slot declarations are indexed by."""
    path = node.get("aqlPath", "")
    if path.endswith("/value"):
        path = path[:-len("/value")]
    segs = AQL_SEGMENT_RE.findall(path)
    if not segs:
        return (None, None)
    attr_name = segs[-1][0]
    parent_key = segs[-2][1] if len(segs) > 1 else None
    if parent_key and not parent_key.startswith(("at", "id")):
        parent_key = "at0000"   # archetype root object
    return (parent_key, attr_name)


def wt_is_archetype_root(node):
    return node.get("nodeId", "").startswith("openEHR-")


def wt_label(node, opts, value_set=None):
    rm = node["rmType"]
    name = (node.get("localizedNames") or {}).get(opts.lang) \
        or node.get("localizedName") or node.get("name") or node.get("id") or rm
    arch = node["nodeId"] if wt_is_archetype_root(node) else ""
    dt = ""
    if rm == "ELEMENT":
        dt = " | ".join(c["rmType"] for c in node.get("children", [])
                        if not c.get("inContext"))
    elif rm.startswith("DV_") and node.get("aqlPath", "").endswith("/value"):
        rm, dt = "ELEMENT", rm
    descs = node.get("localizedDescriptions") or {}
    desc = descs.get(opts.lang) or descs.get("en") or ""
    return render_label(name, rm, arch, False, wt_occurrences(node), dt, opts,
                        desc, value_set)


def wt_group_by_slot(children, arch):
    groups = []
    for child in children:
        slot_code = None
        if arch and wt_is_archetype_root(child):
            parent_key, attr_name = wt_position(child)
            slot_code = arch.slot_for(parent_key, attr_name, child["nodeId"])
        if slot_code and groups and groups[-1][0] == slot_code:
            groups[-1][1].append(child)
        else:
            groups.append((slot_code, [child]))
    return groups


def wt_walk(node, depth, out, opts, current_arch):
    if node.get("inContext") and not opts.in_context:
        return
    if wt_is_archetype_root(node):
        current_arch = opts.archetypes.get(node["nodeId"])
        if current_arch is None:
            opts.missing_sources.add(node["nodeId"])

    value_set = wt_value_set(node, opts) if opts.value_sets else None
    out.append(f"{'  ' * depth}- {wt_label(node, opts, value_set)}")
    depth += 1
    opts.emitted += 1
    if node["rmType"] == "ELEMENT" and not opts.containers:
        return

    children = node.get("children", [])
    groups = wt_group_by_slot(children, current_arch) \
        if opts.group_slots else [(None, [c]) for c in children]
    for slot_code, group in groups:
        group_depth = depth
        if slot_code and len(group) > 1:
            name = current_arch.term(slot_code, opts.lang) \
                or archetype_concept_name(group[0]["nodeId"])
            desc = current_arch.term(slot_code, opts.lang, "description")
            out.append(f"{'  ' * depth}- "
                       f"{slot_header_label(name, len(group), opts, desc)}")
            opts.emitted += 1
            opts.grouped += 1
            group_depth = depth + 1
        for child in group:
            wt_walk(child, group_depth, out, opts, current_arch)


def render_opt(opt_path, opts):
    """(title, body lines) for a flattened OPT."""
    root = ET.parse(opt_path).getroot()
    definition = next((c for c in root if local(c) == "definition"), None)
    if definition is None:
        sys.exit("no <definition> found -- is this an OPT rather than an OET?")
    tid = next((c for c in root if local(c) == "template_id"), None)
    title = (child_text(tid, "value") if tid is not None else "") \
        or child_text(root, "concept") or "Operational template"
    body = []
    walk(definition, {}, 0, body, opts,
         guess_root_archetype(rm_class(definition), opts.archetypes))
    return title, body


def render_web_template(path, opts):
    """(title, body lines) for a Web Template .json."""
    with open(path, encoding="utf-8") as fh:
        wt = json.load(fh)
    body = []
    wt_walk(wt["tree"], 0, body, opts, None)
    return wt.get("templateId") or "Web template", body


# The IG Publisher QA-checks every HTML file in the output, including ones
# copied verbatim from input/images. It requires a lang attribute, a footer
# marked igtool="footer" and the publish box (which it fills with the build
# notice). Both go into a small bar overlaid on the map's corner, so the map
# keeps its full-window layout.
IG_FOOTER = """<style>
#ig-footer {
  position: fixed; left: 0.5rem; bottom: 0.5rem; max-width: 60vw;
  font-size: 0.7rem; color: #78909c; background: rgb(255 255 255 / 0.85);
}
#ig-footer a { color: inherit; }
</style>
<div id="ig-footer" igtool="footer">
<!--ReleaseHeader--><p id="publish-box">Publish Box goes here</p><!--EndReleaseHeader-->
</div>
"""


# ------------------------------------------------------------- tree view --
# markmap only lays out left to right. The HTML page therefore also gets an
# indented, collapsible tree of the same nodes (<details> elements, built
# here from the Markdown), shown over the map at <page>#tree. The switch is
# plain CSS (:target).

ITEM_RE = re.compile(r"( *)- (.*)")
INLINE_CODE_RE = re.compile(r"`([^`]+)`")
STRONG_RE = re.compile(r"\*\*(.+?)\*\*")
EM_RE = re.compile(r"\*([^*\s][^*]*?)\*")


def inline_markdown(label):
    """The inline Markdown the labels use (`code`, **bold**, *italic*) as
    HTML. HTML tags (and so the title tooltips) are left alone."""
    out = []
    for part in re.split(r"(<[^>]*>)", label):
        if not part.startswith("<"):
            codes = []
            part = INLINE_CODE_RE.sub(
                lambda m: codes.append(m.group(1)) or f"\0{len(codes) - 1}\0", part)
            part = STRONG_RE.sub(r"<strong>\1</strong>", part)
            part = EM_RE.sub(r"<em>\1</em>", part)
            part = re.sub("\0(\\d+)\0",
                          lambda m: f"<code>{codes[int(m.group(1))]}</code>", part)
        out.append(part)
    return "".join(out)


def parse_outline(markdown):
    """[label, children] tree from the Markdown this script writes: a "# "
    root, then "- " items indented two spaces per level."""
    root, stack = None, []
    for line in markdown.split("\n"):
        if line.startswith("# "):
            root = [line[2:], []]
            stack = [root]
            continue
        m = ITEM_RE.fullmatch(line)
        if not m or root is None:  # also skips the frontmatter
            continue
        node = [m.group(2), []]
        del stack[len(m.group(1)) // 2 + 1:]
        stack[-1][1].append(node)
        stack.append(node)
    return root


def tree_items(node, depth, expand, out):
    """Nested <li>s; open like the map (markmap folds from depth `expand`,
    counting the root as 1)."""
    label, children = node
    label = inline_markdown(label)
    if not children:
        out.append(f'<li class="leaf"><span>{label}</span></li>')
        return
    is_open = ' open="open"' if depth + 1 < expand else ""
    out.append(f"<li><details{is_open}><summary>{label}</summary><ul>")
    for child in children:
        tree_items(child, depth + 1, expand, out)
    out.append("</ul></details></li>")


# Tree lines: each nested item draws its own piece of its parent's vertical
# line (::after, stopping at the last item) and a tick towards its label
# (::before, longer for leaves, which have no disclosure marker). Labels go
# on one line: the <br>s before archetype ids and value-set links only
# keep the map's nodes narrow.
TREE_VIEW_CSS = """<style>
#tree {
  position: fixed; inset: 0; overflow: auto; padding: 3rem 1rem 3rem 1.5rem;
  background: white; line-height: 1.5; font-size: 0.95rem;
}
#tree:not(:target) { display: none; }
.markmap-dark #tree { background: #27272a; }
#tree ul { list-style: none; }
#tree ul ul { margin-left: 0.35rem; padding-left: 1rem; }
#tree li { position: relative; }
#tree ul ul > li::before, #tree ul ul > li::after {
  content: ""; position: absolute; left: -1rem; border: 0 solid %(line)s; }
#tree ul ul > li::before { top: 0.75em; width: 0.75rem; border-top-width: 1px; }
#tree ul ul > li.leaf::before { width: 1.6rem; }
#tree ul ul > li::after { top: 0; bottom: 0; border-left-width: 1px; }
#tree ul ul > li:last-child::after { bottom: auto; height: 0.75em; }
#tree summary { cursor: pointer; }
#tree summary::marker { color: %(colour)s; }
#tree .leaf > span { display: block; padding-left: 1rem; }
#tree br { display: none; }
#tree .mm-arch, #tree .mm-vs { margin-left: 0.4em; }
#tree code { background: #f0f0f0; color: #555; padding: 0 0.2em;
  border-radius: 3px; font-size: 0.85em; }
.markmap-dark #tree code { background: #1a1b26; color: #ddd; }
#tree:target ~ .mm-toolbar { display: none; }
#controls {
  position: fixed; top: 0.75rem; right: 0.75rem; display: flex;
  flex-wrap: wrap; justify-content: flex-end; gap: 0.5rem;
  font-size: 0.8rem; line-height: 1.6;
}
#controls > * {
  display: flex; border: 1px solid #d4d4d8; border-radius: 0.25rem;
  background: white; overflow: hidden;
}
#controls > [hidden] { display: none; }
.markmap-dark #controls > * { background: #27272a; border-color: #52525b; }
#controls label { padding: 0 0.5rem; cursor: pointer; color: #555; }
.markmap-dark #controls label { color: #ddd; }
#controls input { margin-right: 0.3rem; vertical-align: -0.1rem;
  accent-color: %(colour)s; }
#view-switch a, #fullscreen { padding: 0 0.6rem; color: %(colour)s;
  text-decoration: none; }
#fullscreen { font: inherit; cursor: pointer; }
#view-switch a.to-map, #tree:target ~ #controls a.to-tree {
  background: %(colour)s; color: white; }
#tree:target ~ #controls a.to-map { background: none; color: %(colour)s; }
</style>
""" % {"colour": COLOUR, "line": "rgb(2 119 189 / 0.35)"}

# Label parts the page can hide: (id, class in render_label, checkbox text).
# Each checkbox hides its class with :has(); markmap watches its nodes' sizes
# and lays the map out again, so this needs no script.
DETAILS = [("occ", "mm-occ", "Occurrences"),
           ("dt", "mm-dt", "Data types"),
           ("arch", "mm-arch", "Archetype ids"),
           ("vs", "mm-vs", "Value sets")]


def tree_view(markdown, expand):
    """The tree element and the controls (view switch, detail checkboxes
    and full-screen button), to go first in <body>: the CSS above selects
    the map's controls as later siblings of #tree."""
    out = ['<div id="tree"><ul>']
    tree_items(parse_outline(markdown), 0, expand, out)
    out.append("</ul></div>")
    details = [d for d in DETAILS if f'class="{d[1]}"' in markdown]
    out.append("<style>" + "".join(
        f"body:has(#show-{key}:not(:checked)) .{cls} {{ display: none; }}"
        for key, cls, _ in details) + "</style>")
    # The "Mind map" link targets #map, an empty span: the publisher's link
    # check doesn't count the SVG's id as a target.
    out.append('<span id="map"></span>')
    out.append('<div id="controls">')
    if details:
        out.append('<div id="details">' + "".join(
            f'<label><input type="checkbox" id="show-{key}" checked="checked"/>'
            f'{text}</label>' for key, _, text in details) + "</div>")
    out.append('<nav id="view-switch"><a class="to-map" href="#map">Mind map</a>'
               '<a class="to-tree" href="#tree">Tree</a></nav>')
    # Shown by PAGE_SCRIPT where the browser allows full screen.
    out.append('<button id="fullscreen" type="button" hidden="hidden">'
               'Full screen</button>')
    out.append("</div>")
    return "\n".join(out) + "\n"


# ------------------------------------------------------------------ script --
# The IG Publisher reports every inline <script> as "not allowed on the HL7
# ci-build", but not a script loaded from a relative src. So all of the
# page's JavaScript (markmap's, inlined by --offline, and PAGE_SCRIPT) goes
# into a .js file next to the page.

SCRIPT_RE = re.compile(r"<script>(.*?)</script>", re.S)
# markmap-cli switches to its dark theme when the OS is in dark mode; the
# page always starts light (the toolbar can still switch).
DARK_MODE_INIT_RE = re.compile(
    r'if \(window\.matchMedia\("\(prefers-color-scheme: dark\)"\)\.matches\) \{'
    r'\s*document\.documentElement\.classList\.add\("markmap-dark"\);\s*\}')

PAGE_SCRIPT = """(() => {
  // markmap's toolbar links its logo to markmap.js.org: open that in a new
  // tab instead of in place of the map (or inside the IG's iframe).
  setTimeout(() => document.querySelectorAll("a.mm-toolbar-brand").forEach((a) => {
    a.target = "_blank";
    a.rel = "noopener";
  }));
  // Full screen where the browser allows it; in an iframe, only with
  // allow="fullscreen". The map is fitted to the new size.
  const button = document.getElementById("fullscreen");
  if (!button || !document.fullscreenEnabled) return;
  button.hidden = false;
  button.addEventListener("click", () => document.fullscreenElement
    ? document.exitFullscreen()
    : document.documentElement.requestFullscreen());
  document.addEventListener("fullscreenchange", () => {
    button.textContent = document.fullscreenElement ? "Exit full screen" : "Full screen";
    setTimeout(() => window.mm && window.mm.fit(), 100);
  });
})();
"""


def build_html(md_path, html_path, title, lang, expand):
    """Render the Markdown into an HTML page with markmap-cli, plus the
    tree view, and move its JavaScript into <page>.js. --offline inlines
    markmap's JavaScript, so the page loads nothing from a CDN."""
    npx = shutil.which("npx")
    if not npx:
        sys.exit("--html needs Node.js (npx) on PATH; the Markdown was "
                 f"still written to {md_path}")
    out_dir = os.path.dirname(html_path)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
    cmd = [npx, "--yes", f"markmap-cli@{MARKMAP_CLI_VERSION}", md_path,
           "-o", html_path, "--offline", "--no-open"]
    result = subprocess.run(cmd)
    if result.returncode != 0:
        sys.exit(f"markmap-cli failed (exit {result.returncode})")
    with open(html_path, encoding="utf-8") as fh:
        page = fh.read()
    page = page.replace("<title>Markmap</title>",
                        f"<title>{html.escape(title)} - mind map</title>", 1)
    page = page.replace("<html>", f'<html lang="{html.escape(lang)}">', 1)

    script = "\n;\n".join(SCRIPT_RE.findall(page) + [PAGE_SCRIPT])
    script, found = DARK_MODE_INIT_RE.subn("", script)
    if not found:
        print("warning: markmap's dark-mode switch not found; the page may "
              "start dark", file=sys.stderr)
    js_path = os.path.splitext(html_path)[0] + ".js"
    page = SCRIPT_RE.sub("", page)
    if "<script" in page:
        print("warning: the page still has a <script> element", file=sys.stderr)

    with open(md_path, encoding="utf-8") as fh:
        markdown = fh.read()
    # The tree goes on top of the map rather than replacing it: markmap
    # measures its nodes on load, which fails while the SVG is hidden.
    page = page.replace("</head>", TREE_VIEW_CSS + "</head>", 1)
    page = page.replace("<body>", "<body>\n" + tree_view(markdown, expand), 1)
    page = page.replace(
        "</body>", f'<script src="{os.path.basename(js_path)}"></script>\n'
        + IG_FOOTER + "</body>", 1)
    with open(html_path, "w", encoding="utf-8", newline="\n") as fh:
        fh.write(page)
    with open(js_path, "w", encoding="utf-8", newline="\n") as fh:
        fh.write(script)
    print(f"wrote {html_path} and {js_path}", file=sys.stderr)


def main():
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("fileset", nargs="?", default=DEFAULT_INPUT,
                    help="fileset .zip, a fileset directory (with "
                         "templates/ and archetypes/), or a bare .opt / "
                         "Web Template .json (default: <repo>/input)")
    ap.add_argument("--archetypes", metavar="DIR",
                    help="folder of source .adl archetypes "
                         "(default: <fileset>/archetypes)")
    ap.add_argument("-o", "--out", help="write UTF-8 Markdown here "
                                        "(default: <repo>/temp/markmap_<timestamp>.md)")
    ap.add_argument("--expand", type=int, metavar="N", default=2,
                    help="markmap initialExpandLevel (default 2)")
    ap.add_argument("--lang", "--language", dest="lang", metavar="CODE", default="en",
                    help="language to resolve slot/node names for (default: en)")
    ap.add_argument("--no-archetype-ids", dest="archetype_ids",
                    action="store_false", default=True)
    ap.add_argument("--no-datatypes", dest="datatypes", action="store_false",
                    default=True)
    ap.add_argument("--no-group-slots", dest="group_slots", action="store_false",
                    default=True,
                    help="don't cluster repeating slot fills under a "
                         "synthesized header")
    ap.add_argument("--omit-unfilled-slots", action="store_true",
                    help="drop ARCHETYPE_SLOT nodes that have no filler "
                         "archetype in this template (the \"(open slot)\" "
                         "placeholders) instead of showing them")
    ap.add_argument("--node-style", choices=("badge", "bold", "plain"),
                    default="badge")
    ap.add_argument("--no-value-sets", dest="value_sets", action="store_false",
                    default=True,
                    help="don't show DV_CODED_TEXT codes (a single code goes "
                         "inline, longer lists as a link to the terminology page)")
    ap.add_argument("--terminology-page", metavar="MD", default=DEFAULT_TERMINOLOGY,
                    help="Markdown page that lists the value sets; nodes link "
                         "to its sections, as <name>.html#<heading> (default: "
                         "input/pagecontent/terminology.md; \"\" for no links)")
    ap.add_argument("--in-context", action="store_true",
                    help="Web Template input: keep RM-level nodes marked "
                         "inContext (language, composer, ism_transition, ...)")
    ap.add_argument("--attributes", action="store_true",
                    help="show RM attribute names (content, items, data...)")
    ap.add_argument("--containers", action="store_true",
                    help="keep ITEM_TREE / ITEM_LIST and friends")
    ap.add_argument("--no-item-wrappers", dest="item_wrappers", action="store_false",
                    default=True,
                    help="hide ITEM_TREE nodes and their \"items\" attribute "
                         "label even when --containers/--attributes are on "
                         "-- they're near-universal boilerplate that rarely "
                         "adds information")
    ap.add_argument("--html", nargs="?", metavar="PATH", const=DEFAULT_HTML,
                    help="also build an interactive HTML page (and its .js) "
                         "with markmap-cli (needs Node/npx; default PATH: "
                         "input/images/template-mindmap.html, which the IG "
                         "publishes)")
    opts = ap.parse_args()

    opts.emitted = opts.pruned = opts.grouped = opts.omitted_slots = 0
    opts.missing_sources = set()
    opts.terminology_headings = load_headings(opts.terminology_page)
    if opts.terminology_page and not os.path.isfile(opts.terminology_page):
        print(f"no {opts.terminology_page}: value sets are not linked", file=sys.stderr)
        opts.terminology_page = ""
    elif opts.terminology_page:
        opts.terminology_page = \
            os.path.splitext(os.path.basename(opts.terminology_page))[0] + ".html"

    opt_path, archetypes_dir, cleanup = resolve_inputs(opts.fileset, opts.archetypes)
    try:
        fileset_root = cleanup or (opts.fileset if os.path.isdir(opts.fileset) else None)
        opts.archetypes = load_archetypes(archetypes_dir, fileset_root)
        print(f"loaded {len(opts.archetypes)} source archetypes from "
              f"{archetypes_dir or '(none found)'}"
              + (f" (+ any .adl under {fileset_root})" if fileset_root else ""),
              file=sys.stderr)
        print(f"reading {opt_path}", file=sys.stderr)

        if opt_path.lower().endswith(".json"):
            title, body = render_web_template(opt_path, opts)
        else:
            title, body = render_opt(opt_path, opts)

        head = ["---", "markmap:", f"  initialExpandLevel: {opts.expand}",
                # No maxWidth: markmap wraps over-long nodes, but a wrapped
                # node's box (and underline) then stays at the full maxWidth.
                # Line breaks are explicit instead (before archetype ids).
                "  color:", f"    - \"{COLOUR}\"",
                # Open/close animation, in ms (markmap's default: 500).
                "  duration: 250",
                "---", ""]
        # The template's root node (e.g. the COMPOSITION) is the map's
        # centre -- promote it to the heading rather than nesting it under
        # the template id.
        if body and body[0].startswith("- ") and \
                all(line.startswith("  ") for line in body[1:]):
            head += [f"# {body[0][2:]}", ""]
            body = [line[2:] for line in body[1:]]
        else:
            head += [f"# {title}", ""]
        text = "\n".join(head + body) + "\n"

        out_path = opts.out or os.path.join(
            DEFAULT_OUTPUT_DIR,
            f"markmap_{datetime.now().strftime('%Y%m%d-%H%M%S')}.md")
        out_dir = os.path.dirname(out_path)
        if out_dir:
            os.makedirs(out_dir, exist_ok=True)

        with open(out_path, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(text)
        print(f"wrote {out_path}", file=sys.stderr)
        print(f"{opts.emitted} nodes emitted ({opts.grouped} synthesized slot "
              f"headers), {opts.pruned} pruned at 0..0"
              + (f", {opts.omitted_slots} unfilled slots omitted"
                 if opts.omit_unfilled_slots else ""), file=sys.stderr)
        if opts.missing_sources:
            print("no source archetype found for (slot grouping skipped inside): "
                  + ", ".join(sorted(opts.missing_sources)), file=sys.stderr)

        if opts.html:
            build_html(out_path, opts.html, title, opts.lang, opts.expand)
    finally:
        if cleanup:
            shutil.rmtree(cleanup, ignore_errors=True)


if __name__ == "__main__":
    main()
