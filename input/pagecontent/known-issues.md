This guide exercises draft tooling on real content, so it has two kinds of known issues: limitations of the **IG Publisher's openEHR support**, and findings from a review of the **source template**. In addition, it lists **modelling decisions** that implementers should be aware of and **open questions** in the use of the template. Tooling problems are documented here rather than suppressed or worked around in the content, so they can be reported to the FHIR-I openEHR initiative. The one exception is the ADL header edit described below.

The issues below were observed with IG Publisher 3.0.1 (October 2026), `openehr.base#0.1.0-snapshot` and `openehr.fhir.template#current`.

### IG Publisher and openehr.base

#### Archetypes not rendered

Three of the fifteen archetypes crash the publisher's ADL importer (`org.hl7.fhir.igtools.openehr.ArchetypeImporter`). A crash aborts the whole build, so these files are kept out of `input/archetypes` and published as [downloads](downloads.html#archetypes) only:

| Archetype | Error | Cause |
|---|---|---|
| `openEHR-EHR-ACTION.medication.v1` | `java.lang.Error: unknown element ACTION.ism_transition` | When an attribute has more than one child constraint, the importer decides how to slice it from a hard-coded list (`HISTORY.events`, `ITEM_TREE.items`, `CLUSTER.items`, `ELEMENT.value`, `DV_QUANTITY.*`). `ACTION.ism_transition` has one child per careflow step and is not in the list. This affects **every** ACTION archetype, and likely other multi-child attributes as well |
| `openEHR-EHR-CLUSTER.case_identification.v0` | `NullPointerException ... ResourceDescriptionItem.getKeywords() is null` | The English description has no `keywords`. The importer iterates over the keywords without a null check |
| `openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1` | same as above | same as above |
{:.grid}

The template still uses these archetypes. Their nodes are fully visible on the [WebTemplate page](WebTemplate-cistec.openehr.medicationorder.v1.html), and the [template walkthrough](template.html) describes them.

#### ADL header edit: `rm_release`

The archetypes exported from Archetype Designer start with `archetype (adl_version=1.4; uid=...)`. With that header, publisher 3.0.1 rejects every file with *"ADL 1.4: model for openEHR.EHR version null not found"*: without an RM release it cannot select a reference model. The **only** change made to the ADL files in this guide is the addition of `rm_release=1.1.0` to the first line, as found in CKM exports. The current publisher source code defaults a missing `rm_release` to `1.1.0`. Once that is in a released publisher, the edit can be dropped.

#### QA messages from the openEHR loaders

The QA report (`qa.html`) for this guide contains several thousand errors and warnings. Almost all of them come from the tooling rather than from this guide's content:

- **WebTemplate validation.** Most of the errors are raised when the web-template JSON is validated against the WebTemplate logical models in `openehr.base`. Those models expect `localizedNames`, `localizedDescriptions` and `localizedLabels` to be **arrays** of `TranslatedString`, while Archetype Designer exports them as **objects** keyed by language. The models also expect numbers as strings and require properties that the export omits (`dependsOn`, `defaultValue`, `maxOp`/`max` on ranges). In addition, the duplicate web-template ids that are legal in nested positions (e.g. `name`, `category`, `amount`) are reported as duplicate ids.
- **Archetype logical models.** The generated `StructureDefinition`s raise:
  - `eld-20` warnings for RM attribute names with underscores (`archetype_node_id`, `null_flavour`, ...);
  - errors on the `type-parameter` and `view-hint` tool extensions;
  - unresolved links to generic types such as `DV_INTERVAL<DV_QUANTITY>`;
  - warnings for URLs without a definition.
- **Page template.** Every page raises one "html source is not well formed" warning. The same warnings appear with empty stub pages, so they come from the page layout and not from this guide's narrative.
- **Mind map scripts.** The [mind map](template.html#mind-map) (`template-mindmap.html`) raises five errors that its inline `<script>` elements are "not allowed on the HL7 ci-build". They are markmap's own JavaScript, which draws the interactive map. The HL7 ci-build only allows scripts from the IG template. This guide is published on GitHub Pages, where the mind map works as intended.
- **WebTemplate as an IG resource.** The IG lists `WebTemplate/cistec.openehr.medicationorder.v1` with a name, as the publisher requires, but the reference itself cannot be resolved by the validator, because WebTemplate is not a FHIR resource type.

The CI build therefore reports the QA counts in the job summary but does not fail on them.

#### Other limitations

- **No OPT support.** The publisher loads web templates, not OPT 1.4 XML. The OPT is a [download](downloads.html) only.
- **No composition instances.** openEHR compositions cannot be loaded or validated as examples. The [Examples](examples.html) are narrative FLAT JSON, checked against the web template with an external script.
- **Template id in page names.** The publisher drops the underscore from the template id in the page name (`WebTemplate-cistec.openehr.medicationorder.v1.html`). In archetype page names it replaces underscores with hyphens.
- **WebTemplate raw downloads.** The "Raw json/xml/ttl" links on the WebTemplate page are broken: the pages are generated in the language folder `en/`, but the files are written to the site root. Use the links on the [Downloads](downloads.html) page instead.
- **`openehr` IG parameter.** The `openehr.fhir.template` adds an IG parameter `openehr=true`, which the publisher reports as unknown. openEHR loading is enabled by the `openehr.base` dependency, not by this parameter.

### openEHR ADL 1.4

#### Translations of archetypes used more than once

`CLUSTER.medication.v2` is used several times in the template (medication details, stock solution, solvent, carrier solution, component, substance), and so is `CLUSTER.therapeutic_direction.v1` (once, periodically, schema, …). The template adapts the texts of their nodes to each context. In ADL 1.4, however, an operational template holds the terminology of an archetype only **once**, taken from the first occurrence in the template. The translated names, descriptions and comments of the later occurrences therefore show the text of the first occurrence, not the text adapted for their context. This is a limitation of ADL 1.4 operational templates and is not expected to be solved before CDRs support ADL 2. When in doubt, use the English texts on the [WebTemplate page](WebTemplate-cistec.openehr.medicationorder.v1.html), and the narrative of this guide.

### Source template review

These findings concern `cistec.openehr.medication_order.v1` itself, as exported on 2026-08-12. They are listed for the template authors and have not been corrected in this guide.

1. **Outdated use/misuse text.** The template description, under language `de` but written in English, says the template covers only "the timing schema 1-1-1-1 and respective variations". Its misuse says that other timing schemas "such as periodically, weekdays, events" are *not* covered. The template now supports seven patterns, including `periodically`, `week_plan` and `conditional` (see [Therapeutic-direction patterns](template.html#therapeutic-direction-patterns)).
2. **Purpose not specified.** The template purpose is "Not Specified" in all three languages. `en` and `fr` have no use or misuse text. The template has no licence statement, and its `fr` copyright reads "© openEHR Foundation", although the custodian is CISTEC AG.
3. **Wrong terminology in defaults.** The default values of `route` (`20053000`, text "Oral use") and `administration_method` (`0004`, "Administration") use terminology `local_terms`, while the constraint is EDQM. A CDR that applies the default would store a coded text whose terminology does not match the template's own constraint.
4. **EDQM labels in German for every language.** All 83 route and 19 administration-method labels are German terms (e.g. "zum Einnehmen") in the `de`, `fr` *and* `en` label sets. Only the default text of the route ("Oral use") is English.
5. **Placeholder French translations.** 337 French texts in the web template (labels, names and descriptions) are untranslated placeholders of the form `*Monday (en)`, e.g. the day-of-week list and the careflow steps.
6. **Obsolete elements kept.** In `unit_conversion_reference`, the archetype comments for `unit_type` and `reference_id` say "OBSOLETE - only included in the data model for backwards compatibility", but the template does not remove them.
7. **Non-UCUM units labelled as UCUM.** In the dose unit list, `mcg` and `mcmol` have the unit system `http://unitsofmeasure.org`, but they are not valid UCUM codes (UCUM uses `ug` and `umol`).
8. **Typo.** The German label for `at0144` reads "Produkt mit meheren Inhaltsstoffen" (should be "mehreren").
9. **Status changes need the whole order.** The INSTRUCTION and the Status ACTION are both 1..1 in one composition, so a status change cannot be recorded on its own (see [Order Lifecycle](lifecycle.html)).
10. **Copied descriptions of the identifiers.** In both the INSTRUCTION and the ACTION protocol, `order_sequence_id`, `derived_from_order_sequence_id`, `derives_to_order_sequence_id` and `order_group_id` all have the description of the order group ID ("Unique identifier for a medication order group …"). Their intended meaning is described on the [Implementation Guidance](implementation.html#identifiers) page.

### Modelling decisions to be aware of

These are not errors. They are deliberate choices, or workarounds for things the archetypes cannot express, that an implementer would not guess from the template alone. Each one is explained on the [Implementation Guidance](implementation.html) page.

- **Redundant start and stop times.** The start of an order's validity period is stored in four places and the stop in three. All of them must be kept consistent.
- **`ACTION.time` is the start of the validity period**, not the time at which the status was recorded. The time of recording is only in the commit audit.
- **`EVENT_CONTEXT.end_time`** is used as the order stop, although it is not in the web template.
- **Order of therapeutic directions.** CDRs have been seen to reject compositions whose therapeutic directions are not in template order.
- **Feeder audit used for links and original values.** The link from a conditional criterion to a workflow-engine rule, the duration as entered (e.g. `P0.5D`) and the infusion rate as entered (e.g. in IE/h) are kept in the feeder audit of the element concerned. Generic openEHR tools will not show them as part of the order.
- **Infusion rate limits as a reference range.** The minimum and maximum rate are stored in `DV_QUANTITY.other_reference_ranges` with the free-text meaning "Limits". A receiving system must know this convention to interpret them as limits.
- **Comparison operator in `magnitude_status`.** In structured conditions, a threshold such as "> 180 mmHg" is a quantity whose `magnitude_status` holds the operator.

### Open questions

These points are not settled for the use of the template. The [Order Lifecycle](lifecycle.html) page shows the current working assumption.

1. **Status changes: update or replace?** It is not decided whether pausing, reactivating and stopping an order updates the current composition in place or closes it and creates a new composition. The lifecycle scenario closes and replaces for "pause now" and "reactivate", and updates in place for "stop now".
2. **Status at the end of an order.** When an order ends by reaching its stop time, or is stopped now by moving its stop time, the scenario does not change its status. Whether it should become *completed* (`532`) or *aborted* with careflow step *Medication order stopped* (`at0015`) is open.
3. **Careflow step of a closed composition.** This guide uses *Major change to order* (`at0039`) for a composition that is closed because a newer one takes over. The template does not prescribe this.
4. **Activation and reactivation** both use *Medication order issued* (`at0002`, `245` active) and cannot be told apart.

