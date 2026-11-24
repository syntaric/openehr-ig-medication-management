# WebTemplate rendering changes

This IG renders its openEHR WebTemplate with a patched IG Publisher. The patch changes the WebTemplate hierarchy table (`WebTemplateRenderer` in `org.hl7.fhir.services`), and a second patch changes the `openehr.base` package.

- **Renderer source:** branch `webtemplate-name-nodeid-description` on the `freshehr/org.hl7.fhir.core` fork.
- **Patched jar:** `input/publisher-patched.jar`. It is about 244 MB, so it is git-ignored and never committed.
- **Build:**

  ```bash
  JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8" java -Xmx6g -jar input/publisher-patched.jar -ig .
  ```

## Name column

- **Node ids:** names show as `Name [archetype_id/nodeId]`, for example `Case identifier [at0001]` or `Medication details [openEHR-EHR-CLUSTER.medication.v2]`. Nodes without a name fall back to their id.
- **AQL path pop-up:** hovering over a name shows its AQL path at once, in a pop-up whose text can be selected and copied. This replaces the native hover text, which some browsers were slow to show or didn't show. The pop-up is styled by `input/includes/fragment-css.html`. That file overrides the openEHR template's version of the same file, so if the template's version changes, its new content has to be copied in. Where that CSS isn't loaded, the pop-up stays hidden.
- **RM attributes:** nodes without a nodeId, such as `category`, `setting` and `current_state`, link to the RM class that declares them.
- **Width:** 41% of the table, down from about 52%. Long names wrap beside the tree, and a long `[archetype_id]` can break mid-identifier.
- **Tree lines:** the vertical lines run unbroken through rows that wrap onto more than one line.

## Description column

- This replaces the old Definition column. It shows the node description in the page language, falling back to the template's default language.
- For an RM attribute whose element has a terminology binding, it shows the ValueSet and the binding strength. The template's own term bindings are still added after the description.
- Width: 22%, up from about 14%.

## Type column

- Width: 11%. Generic types such as `DV_INTERVAL<DV_DURATION>` can break after the `<`.

## Inputs column

- **No type or attribute names:** the input type (`TEXT`, `CODED_TEXT`…) and the attribute name (`code`, `value`, `magnitude`, `unit`) are not shown, because the Type column already gives the data type.
- **Codes:** each code is on its own line, in code-phrase style:
  - openEHR codes look like `openehr::433 | event |`. Each is linked to its concept, under a heading such as "from Composition Category".
  - Local codes look like `at0143 | Ad-hoc mixture |`.
  - Codes from other terminologies look like `EDQM::20053000 | … |`.
  - A list with no terminology is treated as openEHR codes only when every code is found in the openEHR terminology.
- **Defaults:** shown as `Default: at0146 | Ingredient |`, or as the plain value for a non-coded default, for example `Default: 06:00:00.000`.
- **Validation:** ranges such as `>=1` start on a new line. Rules the table does not display, such as time formats, leave no blank line.
- Width: about 22%, up from about 15%.

## base-spec patch

The Description column depends on a fix to the `openehr.base` logical model, on branch `webtemplate-localized-maps` of the `freshehr/openehr-base-spec` fork. It declares `localizedNames` and `localizedDescriptions` as maps keyed by language, so that they survive parsing.

For local builds, this fix is applied by hand to the cached package `~/.fhir/packages/openehr.base#0.1.0-snapshot`, with the original file kept as `StructureDefinition-WebTemplateItem.json.orig`. A refresh of the package cache undoes it, and it stays that way until the fix is merged upstream.

## Upstream status

The pull requests hapifhir/org.hl7.fhir.core#2882 and openehr-fhir/base-spec#7 are closed. The changes are kept only on the `freshehr` fork branches.

## Renderer commits

| Commit | Change |
| --- | --- |
| `da354a2` | Show the nodeId with the name and add node descriptions |
| `4ce2f5a` | Link RM attributes and openEHR terminology codes |
| `870560b` | Drop input types and show codes as code phrases |
| `0ebe0f6` | Column widths, wrapping names and plainer inputs |
| `7c3ddda` | Labelled defaults and continuous tree lines |
| `f0247e3` | AQL path as a hover pop-up |
