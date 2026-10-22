This page walks through the operational template `cistec.openehr.medication_order.v1`. The complete tree, with every node, occurrence, data type and value list, is on the **[WebTemplate page](WebTemplate-cistec.openehr.medicationorder.v1.html)**. Node names below are the web-template ids used in FLAT paths, with the archetype in brackets.

### Mind map

The mind map below shows the same tree for an overview. Slot fills are grouped under the slot they fill, hovering a node shows its description, and coded values are listed under a collapsed *Value set* node. Click a node to expand or collapse it, and drag or scroll to move and zoom. [Open the mind map full screen](template-mindmap.html).

<iframe src="template-mindmap.html" title="Mind map of the template cistec.openehr.medication_order.v1" style="width: 100%; height: 600px; border: 1px solid #ccc;"></iframe>

### Context

| Node | Occurrences | Content |
|---|---|---|
| `context/start_time` | 1..1 | Start of the period in which this composition is valid. This is not the time of recording, see [Validity period](implementation.html#validity-period-start-and-stop-times) |
| `context/_end_time` | (RM attribute) | End of that period. `EVENT_CONTEXT.end_time` is not listed in the web template but is set whenever the order has a stop |
| `context/setting` | 1..1 | openEHR setting code |
| `context/case_identification/case_identifier` | 1..1 | Hospital case (encounter) identifier ([CLUSTER.case_identification.v0](downloads.html#archetypes)) |
{:.grid}

### Order

The `INSTRUCTION` ([medication_order.v3](StructureDefinition-openEHR-EHR-INSTRUCTION.medication-order.v3.html)) has one activity, **Order** (`order`).

#### What is ordered

- **`medication_item`** (1..1, text): the name of the ordered product or article. In KISIM this is filled with the hospINDEX `DSCRD` description.
- **`medication_details`** (0..1, [CLUSTER.medication.v2](StructureDefinition-openEHR-EHR-CLUSTER.medication.v2.html)): the structured description. `category` distinguishes ad-hoc mixtures, single- and multi-ingredient products and combination products. Strength, concentration and amount are optional. Nested `CLUSTER.medication.v2` instances are renamed to show their role:
  - **`stock_solution`** (0..\*): a prepared stock solution. It can contain components, substances and a **`solvent`**. A solvent may carry a **`solvent_selection`** ([mixture_medium_selection_cistec.v1](StructureDefinition-openEHR-EHR-CLUSTER.mixture-medium-selection-cistec.v1.html)).
  - **`carrier_solution`** (0..\*): the carrier (e.g. NaCl 0.9%) with its own **`carrier_solution_selection`**. This states whether the medium is *Required* or one *Alternative* among several, groups alternatives by `option_identifier`, and applies a `selection_rule` (*Exactly one option* or *One or more options*).
  - **`medication_component`** (0..\*): a product that forms part of a mixture. It contains at least one `substance`.
  - **`substance`** (0..\*): an active or inactive ingredient, with a `role` (*Therapeutic*, *Adjuvant* or *Excipient*).
- **`knowledge_base_reference`** (0..\*, [CLUSTER.knowledge_base_reference.v1](StructureDefinition-openEHR-EHR-CLUSTER.knowledge-base-reference.v1.html)): this can appear on the medication and on every nested product or substance. It links the item to hospINDEX. See [Terminology](terminology.html#hospindex-references).
- **`dose_lead`** (0..1, [dose_lead_cistec.v1](StructureDefinition-openEHR-EHR-CLUSTER.dose-lead-cistec.v1.html)): `is_dose_lead = true` marks the component or substance that is the basis of the dose calculation. For example, in a mixture dosed "per mg of active substance" it is the substance whose amount the dose refers to.
- **`description`** (0..1, text): a narrative description of the medication, for whatever cannot be expressed with the structured elements.

#### Structuring the medication details

`medication_item` is a name. `medication_details` is what makes the order **self-contained**: a clinician or pharmacist in another hospital, possibly in another country, should be able to understand the order and to prepare and give the medication from the composition alone, without access to the ordering hospital's drug database. The following rules apply:

- The top-level `medication_details` describes the **whole ordered medication**, whether it is a manufactured product or a mixture prepared on the ward or in the pharmacy. Its `category` says which.
- Each nested level is a `CLUSTER.medication.v2`, renamed to show its role. Name each instance as precisely as possible, e.g. with the product or substance name.
- A **mixture** (`category` *Ad-hoc mixture*) uses `stock_solution` and `carrier_solution` with their children. The other direct children (`medication_component`, `substance`) are left out.
- A **manufactured product**, such as a tablet, uses `medication_component` and/or `substance`. `stock_solution` and `carrier_solution` are left out.
- **Substances** are the leaves of the tree. Their `role` says whether they are active (*Therapeutic*, *Adjuvant*) or inactive (*Excipient*). Listing every ingredient is allowed but not required. Listing **at least all active ingredients** is recommended.
- A **medication component** groups the substances of one part of a product. It is used for combination packs with physically separate parts (e.g. a vaginal capsule and a cream in one pack) and for combined preparations whose active ingredients are listed per component. Components appear directly under `medication_details` for a product, or under a `stock_solution` within a mixture.
- **Solvents and carrier solutions do not have to be fixed** by the prescriber. They can offer several alternatives, and the person who prepares the medication chooses among them. Each `solvent` or `carrier_solution` then carries a `solvent_selection` or `carrier_solution_selection`, which states whether it is *Required* or an *Alternative*. Alternatives that belong together share an `option_identifier`, and the `selection_rule` says whether exactly one or one or more of them are to be used.
- Any level, a product, a component or a substance, can be the **basis of the dose calculation**. It is flagged with `dose_lead/is_dose_lead = true`.
- `knowledge_base_reference` can be attached at **every level**, so that products and substances can still be coded against hospINDEX or another database, even though the order does not depend on it.
- `strength_presentation`, `strength_concentration` and `amount` are optional at every level. Fill them where they are clinically relevant.

Typical medications map onto the tree as follows:

| Ordered medication | `medication_details/category` | Children used |
|---|---|---|
| Tablet with one active ingredient, e.g. ibuprofen 200 mg film-coated tablet | Single-ingredient product | `substance` |
| Product with several active ingredients in one form, e.g. a powder for oral solution with paracetamol, a decongestant and an antihistamine | Multi-ingredient product | `substance` (one per active ingredient) |
| Combination pack, e.g. clotrimazole vaginal capsule and cream | Combination product | `medication_component` (one per part), each with its `substance`s |
| Concentrate diluted in a carrier, e.g. ketorolac 30 mg/ml injection solution in NaCl 0.9% | Ad-hoc mixture | `stock_solution` (with `medication_component` or `substance`), `carrier_solution` |
| Ampoule diluted to a target concentration, e.g. fentanyl diluted to 10 µg/ml | Ad-hoc mixture | `stock_solution` (with the ampoule as `medication_component`), `carrier_solution` |
| Dry powder reconstituted and given in a carrier, e.g. amoxicillin/clavulanic acid powder for infusion | Ad-hoc mixture | `stock_solution` (with the powder as `medication_component` with two `substance`s, and a `solvent`), `carrier_solution` |
{:.grid}

[Example 2](examples.html#2-continuous-iv-infusion-with-bolus-rate-therapy) shows a complete ad-hoc mixture.

#### How it is given

| Node | Occurrences | Content |
|---|---|---|
| `route` | 1..1 | EDQM route of administration (83 codes, default `20053000` "zum Einnehmen" / oral use) |
| `body_site` | 0..1 | Free text. As a `DV_TEXT` it may also be sent coded, e.g. with a SNOMED CT body structure concept |
| `administration_method` | 0..1 | EDQM administration method (19 codes, default `0004` "Administration") |
| `installation` | 0..\* | The line or device used ([CLUSTER.device.v1](StructureDefinition-openEHR-EHR-CLUSTER.device.v1.html)) with `device_name` and 0..\* **`lumen`** entries (`lumen_name`, `type`, `description`) |
{:.grid}

#### Therapeutic-direction patterns

The timing and dose are given by one or more **therapeutic directions** ([CLUSTER.therapeutic_direction.v1](StructureDefinition-openEHR-EHR-CLUSTER.therapeutic-direction.v1.html)). The template defines seven renamed variants, each a different dosing pattern. Every pattern has a mandatory `therapeutic_direction_start_date_time` and an optional stop date/time. The dose itself is a [CLUSTER.dosage.v2](StructureDefinition-openEHR-EHR-CLUSTER.dosage.v2.html), and timing uses [CLUSTER.timing_daily.v1](StructureDefinition-openEHR-EHR-CLUSTER.timing-daily.v1.html) and [CLUSTER.timing_nondaily.v1](StructureDefinition-openEHR-EHR-CLUSTER.timing-nondaily.v1.html).

| Pattern (id) | Occurrences | Use | Structure |
|---|---|---|---|
| Once (`once`) | 0..\* | Single administration, e.g. a premedication | `dosage` (dose from the unit list, optional `reference_substance`), `timing_once/point_in_time_for_application`, `as_required`, optional `administration_duration` |
| Periodically (`periodically`) | 0..\* | Every *n* hours or every *n* days, e.g. "every 8 h" | `dosage` with `timing_-_daily` (`repetition_interval_for_hours_and_minutes`, max 72 h; `specific_time_for_first_application`) and/or `timing_-_non-daily` (`repetition_interval_for_days`, `specific_date_for_first_application`) |
| Schema (`schema`) | 0..\* | Fixed daily times: morning, noon, evening, night (e.g. **1-0-1-0**) | Four optional `dosage` clusters `morning`, `noon`, `evening` and `night`, each with `dose`, `time_period_for_application` (time or time interval) and `as_required`. A zero position is simply omitted |
| Day plan (`day_plan`) | 0..\* | Different doses at exact clock times on every day | 1..\* `time_event`, each with `dose` and 1..\* `timing_-_daily/point_in_time_for_application` |
| Week plan (`week_plan`) | 0..\* | Doses on specific weekdays, e.g. methotrexate every Monday | 1..\* `dosage` with clock times, and a mandatory `timing_-_non-daily/specific_day_of_week` (1..7, Monday to Sunday) |
| Conditional (`conditional`) | 0..\* | As-needed (PRN) or rule-based dosing | `priority`; `dosage` with a dose as a quantity **or** a range; `timing` (`minimum_interval` max 24 h, `is_conditional` fixed to `true`, `conditional_criterion` text); structured conditions in [conditional_medication_rules_cistec.v1](downloads.html#archetypes): OR-groups (`conditional_medication_instructions_-_or`) of AND-rules (`condition_rule_-_and`), each with a `condition_name` and a `condition` value (quantity, count, proportion, text, boolean or their intervals) |
| Rate therapy (`rate_therapy`) | **0..1** | Continuous infusion, optionally with a bolus | `rate` (`administration_rate` in `l/d`, `l/h`, `ml/h`, `ml/min`, `ml/s` or `ml/d`; optional `dose_formula`; first-application time) and an optional `bolus` (`dose`, `minimum_interval`, `administration_duration` in minutes) |
{:.grid}

Several patterns may be combined in one order, and their periods may overlap or follow each other:

- **Overlapping:** a `schema` for the regular dose plus a `conditional` for reserve doses, both valid at the same time ([Example 5](examples.html#5-regular-dose-as-required-plus-reserve-dose-overlapping-therapeutic-directions)).
- **Consecutive:** a tapering scheme, where each step is its own direction with its own start and stop ([Example 4](examples.html#4-tapering-dose-consecutive-therapeutic-directions)).

When several directions are combined, they must appear in **template order** (once, periodically, schema, day plan, week plan, conditional, rate therapy), and the order-level start and stop must cover all of them. See [Implementation Guidance](implementation.html#order-of-therapeutic-directions).

**As required** and **conditional** are different. `as_required = true` on a scheduled position (e.g. the evening dose of a schema) means that the dose is offered at its planned time and given only if the patient needs or wants it. A `conditional` direction has no planned times: the dose is given whenever the condition in `conditional_criterion` is met, at most as often as `minimum_interval` allows. The condition can be linked to a rule in a workflow engine and stored as structured rules. See [Conditional (reserve) administration](implementation.html#conditional-reserve-administration).

#### Safety, order-level details and comments

- **`medication_safety/maximum_dose`** (0..\*): `maximum_amount` (quantity) and `allowed_period` (duration), e.g. max. 4000 mg per `P1D`.
- **`clinical_indication`** (0..\*, text) and **`comment`** (0..1).
- **`order_details`** (0..1): `order_start_date_time` (1..1) and `order_stop_date_time`. These cover the whole order, as opposed to a single therapeutic direction: the start is the earliest start and the stop the latest stop of all directions. Although optional in the template, they should always be filled (see [Validity period](implementation.html#validity-period-start-and-stop-times)).
- `timing` (`DV_PARSABLE`) and `action_archetype_id` are mandatory RM attributes of the activity. CDRs usually fill them with defaults.

#### Protocol

| Node | Occurrences | Content |
|---|---|---|
| `order_sequence_id` | 1..1 | Identifier of the clinical order. All compositions that record the same order over time share it (see [Order Lifecycle](lifecycle.html)). It must differ from the composition UID |
| `derived_from_order_sequence_id` / `derives_to_order_sequence_id` | 0..\* | Links to a different order that this order replaces, or is replaced by |
| `order_group_id` | 0..\* | Groups orders that belong together. An order can be in several groups |
| `unit_conversion_reference` | 0..\* | ([unit_conversion_reference_cistec.v1](StructureDefinition-openEHR-EHR-CLUSTER.unit-conversion-reference-cistec.v1.html)) UUIDs of the unit (`unit_id`) and substance (`substance_id`) entries that define how the dose unit converts, and which dose they apply to (`referenced_dose`, `DEFAULT` for single-dose orders). `unit_type` and `reference_id` are obsolete (see [Known Issues](known-issues.html#source-template-review)) |
{:.grid}

### Status

The `ACTION` named **Status** ([ACTION.medication.v1](downloads.html#archetypes)) records the order's state in the Instruction State Machine. It does not record administrations: the template constrains the ACTION to order lifecycle steps only.

| Careflow step (`careflow_step`) | Code | ISM state (`current_state`) |
|---|---|---|
| Medication order issued | `at0002` | `245` active |
| Medication order suspended | `at0009` | `530` suspended |
| Medication order stopped | `at0015` | `531` aborted |
| Major change to order | `at0039` | `531` aborted |
| Medication order completed | `at0007` | `532` completed |
| Medication order deleted | `at0150` | `528` cancelled |
{:.grid}

The ACTION repeats all identifiers of the INSTRUCTION (`order_sequence_id`, `derived_from_order_sequence_id`, `derives_to_order_sequence_id`, `order_group_id`) with exactly the same values, and may record free-text `reason`s. Its `time` is the start of the composition's validity period.

When a running order is changed, the current composition is closed with *Major change to order* (`at0039`, `aborted`) and a new composition with the same `order_sequence_id` takes over. A pause is a composition with the state *suspended*. The [Order Lifecycle](lifecycle.html) page shows the full sequence.

### Archetypes used

| Archetype | Logical model |
|---|---|
| COMPOSITION.request.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-COMPOSITION.request.v1.html) |
| INSTRUCTION.medication_order.v3 | [StructureDefinition](StructureDefinition-openEHR-EHR-INSTRUCTION.medication-order.v3.html) |
| ACTION.medication.v1 | not rendered, [ADL download](openEHR-EHR-ACTION.medication.v1.adl) |
| CLUSTER.case_identification.v0 | not rendered, [ADL download](openEHR-EHR-CLUSTER.case_identification.v0.adl) |
| CLUSTER.medication.v2 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.medication.v2.html) |
| CLUSTER.dosage.v2 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.dosage.v2.html) |
| CLUSTER.therapeutic_direction.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.therapeutic-direction.v1.html) |
| CLUSTER.timing_daily.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.timing-daily.v1.html) |
| CLUSTER.timing_nondaily.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.timing-nondaily.v1.html) |
| CLUSTER.device.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.device.v1.html) |
| CLUSTER.knowledge_base_reference.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.knowledge-base-reference.v1.html) |
| CLUSTER.dose_lead_cistec.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.dose-lead-cistec.v1.html) |
| CLUSTER.mixture_medium_selection_cistec.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.mixture-medium-selection-cistec.v1.html) |
| CLUSTER.unit_conversion_reference_cistec.v1 | [StructureDefinition](StructureDefinition-openEHR-EHR-CLUSTER.unit-conversion-reference-cistec.v1.html) |
| CLUSTER.conditional_medication_rules_cistec.v1 | not rendered, [ADL download](openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1.adl) |
{:.grid}

The three archetypes marked "not rendered" crash the current IG Publisher's ADL importer. See [Known Issues](known-issues.html#archetypes-not-rendered).
