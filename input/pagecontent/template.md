This page walks through the operational template `cistec.openehr.medication_order.v1`. The complete tree, with every node, occurrence, data type and value list, is on the **[WebTemplate page](WebTemplate-cistec.openehr.medicationorder.v1.html)**. Node names below are the web-template ids used in FLAT paths, with the archetype in brackets.

### Context

| Node | Occurrences | Content |
|---|---|---|
| `context/start_time` | 1..1 | Time the order was recorded |
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

#### How it is given

| Node | Occurrences | Content |
|---|---|---|
| `route` | 1..1 | EDQM route of administration (83 codes, default `20053000` "zum Einnehmen" / oral use) |
| `body_site` | 0..1 | Free text |
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

Several patterns may be combined in one order, e.g. a `schema` for the regular dose plus a `conditional` for rescue doses.

#### Safety, order-level details and comments

- **`medication_safety/maximum_dose`** (0..\*): `maximum_amount` (quantity) and `allowed_period` (duration), e.g. max. 4000 mg per `P1D`.
- **`clinical_indication`** (0..\*, text) and **`comment`** (0..1).
- **`order_details`** (0..1): `order_start_date_time` (1..1) and `order_stop_date_time`. These cover the whole order, as opposed to a single therapeutic direction.
- `timing` (`DV_PARSABLE`) and `action_archetype_id` are mandatory RM attributes of the activity. CDRs usually fill them with defaults.

#### Protocol

| Node | Occurrences | Content |
|---|---|---|
| `order_sequence_id` | 1..1 | Identifier of this order version |
| `derived_from_order_sequence_id` / `derives_to_order_sequence_id` | 0..\* | Links between successive versions of a changed order |
| `order_group_id` | 0..\* | Groups orders that belong together |
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

A *major change* ends the current order version (`aborted`) and is followed by a new INSTRUCTION. The two versions are linked through `derived_from_order_sequence_id` / `derives_to_order_sequence_id`. The ACTION carries the same `order_sequence_id` as the INSTRUCTION it refers to, and may record free-text `reason`s.

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
