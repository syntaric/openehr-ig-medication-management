### Introduction

This Implementation Guide (IG) publishes an **openEHR use case with the HL7 FHIR IG Publisher**. It demonstrates the approach being developed by the HL7 FHIR Infrastructure (FHIR-I) work group's "openEHR IG in HL7 IG Publisher" initiative: openEHR archetypes and templates are loaded by the standard IG Publisher and rendered with the same tooling, navigation and quality checks as any FHIR IG.

The clinical content is the CISTEC **inpatient medication order** template, `cistec.openehr.medication_order.v1`, built from openEHR CKM archetypes plus four CISTEC-specific clusters.

<div class="note-to-balloters" markdown="1">
This is a **demonstration and test IG**. Its purpose is to exercise the draft openEHR support in the IG Publisher on realistic content, not to define a normative medication specification. See [Known Issues](known-issues.html) for the current limitations of the tooling and the source template.
</div>

### Scope

The template records two things in a single `COMPOSITION.request`:

- **Medication order**: what is to be given (product, ad-hoc mixture, components, substances), how it is to be given (route, administration method, line and lumen), and when and how much (one of seven therapeutic-direction patterns, see [Medication Order Template](template.html#therapeutic-direction-patterns)).
- **Order status**: the state of the order in the openEHR Instruction State Machine (ISM), as an `ACTION.medication` named "Status".

The guide does not cover dispensing, administration recording or medication lists.

### Composition structure

```
COMPOSITION  openEHR-EHR-COMPOSITION.request.v1                 "Medication order"
 |-- context
 |    `-- other_context
 |         `-- CLUSTER  openEHR-EHR-CLUSTER.case_identification.v0
 |-- content
 |    |-- INSTRUCTION  openEHR-EHR-INSTRUCTION.medication_order.v3   "Medication order"
 |    |    |-- activities[Order]
 |    |    |    |-- Medication item
 |    |    |    |-- CLUSTER openEHR-EHR-CLUSTER.medication.v2      (medication details)
 |    |    |    |    `-- CLUSTER knowledge_base_reference.v1 / dose_lead_cistec.v1 /
 |    |    |    |        mixture_medium_selection_cistec.v1
 |    |    |    |-- Route, Administration method
 |    |    |    |-- CLUSTER openEHR-EHR-CLUSTER.device.v1          (installation / lumen)
 |    |    |    |-- CLUSTER openEHR-EHR-CLUSTER.therapeutic_direction.v1  (x 7 patterns)
 |    |    |    |    |-- CLUSTER dosage.v2 / timing_daily.v1 / timing_nondaily.v1
 |    |    |    |    `-- CLUSTER conditional_medication_rules_cistec.v1
 |    |    |    `-- Medication safety, Order details, Clinical indication, Comment
 |    |    `-- protocol
 |    |         |-- Order sequence ID, Order group ID, ...
 |    |         `-- CLUSTER openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1
 |    `-- ACTION  openEHR-EHR-ACTION.medication.v1                  "Status"
 |         |-- ism_transition (current_state, careflow_step)
 |         `-- protocol (Order sequence ID, ...)
```

### Artifacts

| Artifact | Where |
|---|---|
| Operational template as a WebTemplate | [cistec.openehr.medication_order.v1](WebTemplate-cistec.openehr.medicationorder.v1.html) |
| Archetypes as logical models | [Artifacts](artifacts.html) (12 of 15, see [Known Issues](known-issues.html#archetypes-not-rendered)) |
| Value sets for archetype at-codes | [Artifacts](artifacts.html) |
| Example compositions (FLAT format) | [Examples](examples.html) |
| OPT 1.4 XML, web template JSON, ADL files | [Downloads](downloads.html) |
{:.grid}

### How to read the openEHR logical models

Each archetype is shown as a FHIR **logical model** (`StructureDefinition` with `kind = logical`). The model is derived from the openEHR Reference Model class it constrains, e.g. `http://openehr.org/fhir/StructureDefinition/CLUSTER`, which is defined in the `openehr.base` package.

- **Element paths** follow the openEHR RM attribute names, e.g. `CLUSTER.items:at0144.value`. The slice name is the archetype node id (at-code).
- **Short names and definitions** come from the archetype's English terminology. The full multilingual terminology stays in the ADL.
- **Coded constraints** on `DV_CODED_TEXT` local codes become a `CodeSystem` and a required `ValueSet`, named after the archetype and node.
- Each logical model page has an **openEHR View** tab, which shows the RM-style tree, and an **ADL** tab, which shows the archetype source as published.

The **WebTemplate** page shows the template as used at runtime. That is the archetypes after template constraints (removed nodes, renamed nodes, narrowed value sets, defaults), with the web-template ids used in FLAT and STRUCTURED formats.

### Authors and acknowledgements

The template and the CISTEC archetypes are by CISTEC AG (author Hendrik Heiser). The other archetypes come from the openEHR Clinical Knowledge Manager (CKM). See [Background](background.html#provenance-and-licensing) for provenance and licensing.
