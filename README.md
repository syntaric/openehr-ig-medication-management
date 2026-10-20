# openEHR Medication Management Implementation Guide

A demonstration Implementation Guide that publishes an **openEHR use case with the HL7 FHIR IG Publisher**, following the approach of the HL7 FHIR Infrastructure "openEHR IG in HL7 IG publisher" initiative ([openehr-fhir](https://github.com/openehr-fhir)).

The content is the CISTEC inpatient medication order template `cistec.openehr.medication_order.v1` (CISTEC AG, Hendrik Heiser), which consists of a medication order (INSTRUCTION) and its status (ACTION), built from openEHR CKM and CISTEC archetypes.

**Live IG:** https://syntaric.github.io/openehr-ig-medication-management/

| | |
|---|---|
| Package id | `hl7.fhir.uv.openehr-medication-management` |
| Canonical | `http://hl7.org/fhir/uv/openehr-medication-management` |
| FHIR version | R5 (5.0.0), required by `openehr.base` |
| Depends on | `openehr.base#0.1.0-snapshot` |
| IG template | `openehr.fhir.template#current` |

## Repository layout

```
.github/workflows/build-ig.yml   CI: build with the IG Publisher, deploy to GitHub Pages
ig.ini                           IG Publisher entry point
_updatePublisher.sh              download publisher.jar into input-cache/
_genonce.sh                      build the IG once
input/
  openehr-medication-management.xml   ImplementationGuide resource
  archetypes/*.adl               ADL 1.4 archetypes, loaded as logical models
  templates/*.json               Archetype Designer web template, loaded as a WebTemplate
  images/                        files copied verbatim to the site: the OPT and the ADLs
                                 the publisher cannot load yet (downloads only)
  includes/menu.xml              site menu
  includes/example-*.json        FLAT composition examples, shown on the Examples page
  pagecontent/*.md               narrative pages
  ignoreWarnings.txt             intentionally empty (no suppressed QA messages)
```

## Building locally

Requirements: Java 17+ (21 recommended), [Jekyll](https://jekyllrb.com/) and network access for the first build (packages and the terminology server).

```bash
./_updatePublisher.sh          # once, or to update the publisher; optional arg: release tag
./_genonce.sh                  # builds into output/; open output/index.html
```

The QA report is in `output/qa.html`. Most QA errors come from the draft openEHR support in the publisher and the `openehr.base` package. They are explained on the Known Issues page of the IG.

## Publishing (GitHub Pages)

Every push to `main` builds the IG and deploys `output/` to GitHub Pages. Pull requests are built but not deployed. The workflow uses `actions/upload-pages-artifact` and `actions/deploy-pages`; no `gh-pages` branch is involved.

**One-time setup:** in the GitHub repository, go to *Settings → Pages → Build and deployment → Source* and select **GitHub Actions**.

The publisher version is set by `PUBLISHER_VERSION` in the workflow (`latest` by default, or a release tag such as `3.0.1`). The job summary of each run shows the QA error, warning and hint counts. The QA report is attached as the `qa-report` artifact.

## Updating the template

1. In Archetype Designer, export the template `cistec.openehr.medication_order.v1`:
   - **Web template** (JSON): save as `input/templates/cistec.openehr.medication_order.v1.json`.
   - **OPT 1.4**: save as `input/images/cistec.openehr.medication_order.v1.opt`. Never put an OPT in `input/templates` or `input/archetypes`: the publisher would try to parse it as ADL and fail.
   - **Archetypes** (ADL 1.4): copy them into `input/archetypes/`.
2. Add `rm_release=1.1.0` to the first line of each ADL file if it is missing (`archetype (adl_version=1.4; rm_release=1.1.0; uid=...)`). IG Publisher 3.0.1 cannot load ADL 1.4 without it:

   ```bash
   sed -i '1s/^archetype (adl_version=1\.4; uid=/archetype (adl_version=1.4; rm_release=1.1.0; uid=/' input/archetypes/*.adl
   ```

3. Archetypes that crash the publisher's importer go into `input/images/` instead of `input/archetypes/`. Currently these are ACTION archetypes, and archetypes whose English description has no keywords. Record any such archetype on `input/pagecontent/known-issues.md`.
4. If node ids changed, update the FLAT examples in `input/includes/` and the walkthrough in `input/pagecontent/template.md`.

## Licence

The IG narrative is licensed under CC BY 4.0. The archetypes and the template keep their own licences (CC BY-SA 3.0 / 4.0), as stated in each file. The repository code is under the [Apache 2.0 licence](LICENSE).
