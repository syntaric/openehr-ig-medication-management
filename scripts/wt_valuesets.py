#!/usr/bin/env python3
"""
Generate FHIR ValueSets (and CodeSystems where needed) for the coded input lists of the
openEHR WebTemplates in input/templates, so the WebTemplate page can link each list to one.

Run from the repo root before building the IG:

    python3 scripts/wt_valuesets.py

Output goes to input/valuesets/ (loaded through a path-resource parameter). Each run rewrites
that folder, so do not edit the files by hand.

Which lists get what:
- Local at-codes of an archetype loaded from input/archetypes: the IG Publisher already makes a
  CodeSystem and ValueSet for each coded node ({canonical}/CodeSystem/{archetype}.{node}). If the
  template keeps the archetype's whole list, nothing is generated and that ValueSet is reused.
  If the template narrows the list, a template ValueSet over the publisher's CodeSystem is made.
- Local at-codes of any other archetype: a CodeSystem (content = fragment, the template's codes
  only) and a ValueSet, using the same URL pattern as the publisher.
- openEHR terminology codes: a ValueSet over the openehr.base CodeSystem(s) that define them.
- External terminologies (EDQM, SNOMED-CT...): a ValueSet over the terminology's FHIR system.
- DV_QUANTITY unit lists: a ValueSet over UCUM.
Text suggestion lists (listOpen) and boolean lists are skipped.

The WebTemplate renderer cannot search all ValueSets, so it tries the ids this script uses, under the
IG canonical: {archetype id with _ as -}.{node}[.template|.units][-n], and accepts one only if it
enumerates exactly the list's codes from the list's system. Keep the ids in step with the renderer.
"""

import glob
import json
import os
import re
import shutil
import sys
import xml.etree.ElementTree as ET

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEMPLATES = os.path.join(ROOT, "input", "templates")
ARCHETYPES = os.path.join(ROOT, "input", "archetypes")
OUT = os.path.join(ROOT, "input", "valuesets")
IG_XML = os.path.join(ROOT, "input", "openehr-medication-management.xml")
OPENEHR_BASE = os.path.expanduser("~/.fhir/packages/openehr.base#0.1.0-snapshot/package")
OPENEHR_CS_PREFIX = "https://specifications.openehr.org/fhir/codesystem-"

# WebTemplate terminology id -> FHIR system. Keep in step with the WebTemplate renderer.
EXTERNAL_SYSTEMS = {
    "SNOMED-CT": "http://snomed.info/sct",
    "SNOMED CT": "http://snomed.info/sct",
    "LOINC": "http://loinc.org",
    "EDQM": "http://standardterms.edqm.eu",
    "ICD10": "http://hl7.org/fhir/sid/icd-10",
    "ICD-10": "http://hl7.org/fhir/sid/icd-10",
    "UCUM": "http://unitsofmeasure.org",
}
UCUM = "http://unitsofmeasure.org"

# Marks the resources this script makes
TAG = {"system": "http://openehr.org/fhir/CodeSystem/generated-from", "code": "webtemplate-input-list",
       "display": "Generated from a WebTemplate input list"}


def canonical():
    ns = {"f": "http://hl7.org/fhir"}
    url = ET.parse(IG_XML).getroot().find("f:url", ns).get("value")
    return url.split("/ImplementationGuide/")[0]


def slug(archetype_id):
    """Archetype id as the IG Publisher writes it in resource ids (underscores become hyphens)."""
    return archetype_id.replace("_", "-")


def fhir_id(s):
    s = re.sub(r"[^A-Za-z0-9\-.]", "-", s)
    return s[:64]


def fhir_name(s):
    words = re.findall(r"[A-Za-z0-9]+", s)
    n = "".join(w[:1].upper() + w[1:] for w in words) or "List"
    return n if n[0].isalpha() else "VS" + n


def archetype_lists():
    """{archetype id: {node id: [at-codes]}} for the [local::...] lists in the loaded ADL files."""
    result = {}
    for f in glob.glob(os.path.join(ARCHETYPES, "*.adl")):
        aid = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8").read()
        nodes = {}
        for m in re.finditer(r"\[local::([^\]]*)\]", text):
            before = text[:m.start()]
            owner = re.findall(r"\b[A-Z_]+\[(at[0-9.]+)\]", before)
            if not owner:
                continue
            codes = re.findall(r"\bat[0-9.]+", m.group(1))
            nodes[owner[-1]] = codes
        result[aid] = nodes
    return result


def openehr_codes():
    """{openEHR code: set of CodeSystem urls} from the openehr.base package (a code can be in several groups)."""
    codes = {}
    for f in glob.glob(os.path.join(OPENEHR_BASE, "CodeSystem-*.json")):
        cs = json.load(open(f, encoding="utf-8"))
        url = cs.get("url", "")
        if not url.startswith(OPENEHR_CS_PREFIX):
            continue

        def walk(concepts):
            for c in concepts:
                codes.setdefault(c["code"], set()).add(url)
                walk(c.get("concept", []))
        walk(cs.get("concept", []))
    return codes


def main():
    canon = canonical()
    loaded = archetype_lists()
    oe_codes = openehr_codes()
    if not oe_codes:
        print("warning: openehr.base CodeSystems not found in " + OPENEHR_BASE, file=sys.stderr)

    valuesets = {}     # key (system, codes) -> ValueSet
    codesystems = {}   # url -> CodeSystem
    ids = set()
    reused = []
    skipped = []

    def add_valueset(key, base_id, title, description, includes):
        # one ValueSet per node and list: the renderer looks a list up from its own node's id,
        # so the same codes on two different nodes get a ValueSet each
        key = (base_id,) + key
        if key in valuesets:
            return
        vid = fhir_id(base_id)
        n = 2
        while vid in ids:
            vid = fhir_id(base_id)[:61] + "-" + str(n)
            n += 1
        ids.add(vid)
        valuesets[key] = {
            "resourceType": "ValueSet",
            "id": vid,
            "meta": {"tag": [TAG]},
            "url": canon + "/ValueSet/" + vid,
            "name": fhir_name(title) + "InputList",
            "title": title,
            "status": "draft",
            "experimental": False,
            "description": description,
            "compose": {"include": includes},
        }

    for f in sorted(glob.glob(os.path.join(TEMPLATES, "*.json"))):
        wt = json.load(open(f, encoding="utf-8"))
        if "tree" not in wt:
            continue
        template_id = wt.get("templateId", os.path.basename(f))

        def walk(node, archetype, root_name):
            nid = node.get("nodeId") or ""
            name = node.get("name") or node.get("id")
            if nid.startswith("openEHR-"):
                archetype = nid
                root_name = name
            title_ctx = " (%s)" % root_name if root_name and root_name != name else ""
            node_key = nid if nid and not nid.startswith("openEHR-") else node.get("id")
            for inp in node.get("inputs", []):
                items = inp.get("list") or []
                if not items or inp.get("type") in ("TEXT", "BOOLEAN"):
                    continue
                codes = [i.get("value") for i in items]
                labels = {i.get("value"): i.get("label") for i in items}
                term = inp.get("terminology")
                where = "%s (%s) in template %s" % (name, node.get("aqlPath"), template_id)

                def concepts(cs):
                    return [{"code": c, "display": labels[c]} if labels.get(c) else {"code": c} for c in cs]

                if inp.get("suffix") == "unit":
                    add_valueset((UCUM, tuple(sorted(codes))), "%s.%s.units" % (slug(archetype), node_key),
                                 name + " units" + title_ctx, "Units allowed for " + where + ".",
                                 [{"system": UCUM, "concept": [{"code": c} for c in codes]}])
                elif term in (None, "local") and all(c and c.startswith("at") for c in codes):
                    cs_id = fhir_id("%s.%s" % (slug(archetype), node_key))
                    cs_url = canon + "/CodeSystem/" + cs_id
                    arch_codes = loaded.get(archetype, {}).get(node_key)
                    if arch_codes is not None and set(arch_codes) == set(codes):
                        reused.append(cs_id)  # the publisher's own ValueSet covers it
                        continue
                    if arch_codes is None and cs_url not in codesystems:
                        codesystems[cs_url] = {
                            "resourceType": "CodeSystem",
                            "id": fhir_id(cs_id),
                            "meta": {"tag": [TAG]},
                            "url": cs_url,
                            "name": fhir_name(name) + "Codes",
                            "title": name + title_ctx,
                            "status": "draft",
                            "experimental": False,
                            "description": "Local codes of %s, node %s, as used by %s. Only the codes the "
                                           "template uses are listed." % (archetype, node_key, where),
                            "caseSensitive": True,
                            "content": "fragment",
                            "concept": concepts(codes),
                        }
                    elif arch_codes is None:
                        cs = codesystems[cs_url]
                        have = {c["code"] for c in cs["concept"]}
                        cs["concept"] += [c for c in concepts(codes) if c["code"] not in have]
                    vs_id = cs_id if arch_codes is None else cs_id + ".template"
                    add_valueset((cs_url, tuple(sorted(codes))), vs_id, name + title_ctx,
                                 "Codes allowed for " + where + ".",
                                 [{"system": cs_url, "concept": concepts(codes)}])
                elif term == "openehr" or (term is None and codes and all(c in oe_codes for c in codes)):
                    # the one openEHR CodeSystem (group) that defines every code in the list
                    common = None
                    for c in codes:
                        common = set(oe_codes.get(c, set())) if common is None else common & oe_codes.get(c, set())
                    if not common:
                        skipped.append("%s: no single openEHR CodeSystem has all its codes" % where)
                    else:
                        system = sorted(common)[0]
                        add_valueset((system, tuple(sorted(codes))), "%s.%s" % (slug(archetype), node_key),
                                     name + title_ctx, "openEHR codes allowed for " + where + ".",
                                     [{"system": system, "concept": concepts(codes)}])
                elif term in EXTERNAL_SYSTEMS:
                    system = EXTERNAL_SYSTEMS[term]
                    add_valueset((system, tuple(sorted(codes))), "%s.%s" % (slug(archetype), node_key),
                                 name + title_ctx, "%s codes allowed for %s." % (term, where),
                                 [{"system": system, "concept": concepts(codes)}])
                else:
                    skipped.append("%s: terminology %r has no known FHIR system" % (where, term))
            for child in node.get("children", []):
                walk(child, archetype, root_name)

        walk(wt["tree"], None, None)

    if os.path.isdir(OUT):
        shutil.rmtree(OUT)
    os.makedirs(OUT)
    for r in list(codesystems.values()) + list(valuesets.values()):
        path = os.path.join(OUT, "%s-%s.json" % (r["resourceType"], r["id"]))
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(r, fh, indent=2, ensure_ascii=False)
            fh.write("\n")

    print("ValueSets: %d, CodeSystems: %d, reused publisher ValueSets: %d -> %s"
          % (len(valuesets), len(codesystems), len(set(reused)), os.path.relpath(OUT, ROOT)))
    for s in sorted(set(skipped)):
        print("skipped: " + s)


if __name__ == "__main__":
    main()
