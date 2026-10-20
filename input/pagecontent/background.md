### Why publish openEHR content with the FHIR IG Publisher?

openEHR and FHIR both define clinical information models, but each has its own publishing tool chain. openEHR uses the Clinical Knowledge Manager (CKM) and Archetype Designer; FHIR uses the IG Publisher. The HL7 FHIR Infrastructure (FHIR-I) work group runs an initiative, "openEHR IG in HL7 IG publisher", which lets the IG Publisher load openEHR artifacts directly. Implementers can then:

- publish archetypes and templates with the same look, navigation, versioning and QA as FHIR IGs;
- document openEHR and FHIR artifacts side by side in a single guide;
- reuse IG infrastructure such as package registries, `package.tgz`, CI builds and the history of published versions.

This guide is a worked example of that approach on a real hospital use case. The FHIR-I initiative maintains its reference material in the [`openehr-fhir`](https://github.com/openehr-fhir) GitHub organisation, in particular `base-spec` (the `openehr.base` package) and `test-ig`.

### How it works

#### The `openehr.base` package

`openehr.base` represents the openEHR Reference Model (RM) as FHIR R5 logical models, e.g. `http://openehr.org/fhir/StructureDefinition/CLUSTER` and `.../DV_CODED_TEXT`. It also contains logical models for the openEHR WebTemplate format. This IG declares a dependency on `openehr.base`, and that dependency switches on the publisher's openEHR loaders. Because `openehr.base` is FHIR 5.0.0, this IG is an R5 IG.

#### Archetypes (ADL 1.4) become logical models

The publisher loads every `.adl` file in a resource folder (`input/archetypes`) with the [Archie](https://github.com/openEHR/archie) library and converts it as follows:

- The archetype becomes a `StructureDefinition` with `kind = logical`, whose base is the RM class at the root of the archetype (e.g. `CLUSTER`).
- Each constrained node becomes an element. Container attributes such as `CLUSTER.items` are sliced by at-code.
- Each local coded constraint becomes a `CodeSystem` and a `ValueSet`, bound to the element with strength `required`.
- The archetype's English description, purpose, misuse, keywords, copyright and licence fill the corresponding `StructureDefinition` metadata.
- The ADL source is kept and shown on the **ADL** tab of the logical model page.

#### Templates become WebTemplate pages

The publisher does **not** read Operational Template (OPT 1.4 XML) files. Instead it loads the **WebTemplate JSON** that Archetype Designer exports. It recognises the file by its `templateId`, `version`, `defaultLanguage` and `tree` properties, and renders it as `WebTemplate-<id>.html`. The WebTemplate is the flattened, template-constrained tree that FLAT and STRUCTURED composition formats are based on, so it is also what the [Examples](examples.html) use.

The OPT is still distributed as a [download](downloads.html), because it is what openEHR Clinical Data Repositories (CDRs) need to upload a template.

#### Compositions

The publisher has no native support for openEHR composition instances yet. The [Examples](examples.html) are therefore shown as FLAT JSON on a narrative page, rather than as validated instances.

### Provenance and licensing

The content of this guide was exported from Archetype Designer. The export manifest records the following:

| | |
|---|---|
| Source repository | `medikati-2r5` (Archetype Designer, GitLab user `hheis`) |
| Template | `cistec.openehr.medication_order.v1`, semantic version 1.0.0, web template version 2.3, lifecycle `release_candidate` |
| Template author | Hendrik Heiser, CISTEC AG |
| Template custodian and publisher | CISTEC AG (namespace `com.cistec`) |
| Export date | 2026-08-12 |
{:.grid}

The archetypes come from two sources:

| Archetype | Origin | Licence |
|---|---|---|
| `openEHR-EHR-COMPOSITION.request.v1` | openEHR CKM | CC BY-SA 3.0 |
| `openEHR-EHR-INSTRUCTION.medication_order.v3` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-ACTION.medication.v1` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.case_identification.v0` | openEHR CKM | CC BY-SA 3.0 |
| `openEHR-EHR-CLUSTER.medication.v2` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.dosage.v2` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.therapeutic_direction.v1` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.timing_daily.v1` | openEHR CKM | CC BY-SA 3.0 |
| `openEHR-EHR-CLUSTER.timing_nondaily.v1` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.device.v1` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.knowledge_base_reference.v1` | openEHR CKM | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.dose_lead_cistec.v1` | CISTEC AG (Hendrik Heiser) | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1` | CISTEC AG (Hendrik Heiser) | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1` | CISTEC AG (Hendrik Heiser) | CC BY-SA 4.0 |
| `openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1` | CISTEC AG, adapted from a CKM archetype by Ian McNicoll (freshEHR) | CC BY-SA 3.0 |
{:.grid}

The licence and copyright statements in each ADL file are authoritative. The template itself carries no licence statement (see [Known Issues](known-issues.html#source-template-review)). This IG's own narrative content is published under CC BY 4.0. That licence does not change the licences of the archetypes and template it reproduces.
