This page collects the rules that implementers of `cistec.openehr.medication_order.v1` need but that are not visible in the template itself. Some of them follow from requirements that the archetypes cannot express directly, some from the behaviour of current openEHR CDRs. The [Order Lifecycle](lifecycle.html) page applies these rules to a sequence of changes to one order.

FLAT paths are given relative to `medication_order/medication_order/order/` where this is unambiguous. Keys that start with an underscore (`_end_time`, `_feeder_audit`, `_other_reference_ranges`, `_identifier`) address Reference Model attributes that are not part of the web template. CDRs accept them in FLAT compositions, but they do not appear on the [WebTemplate page](WebTemplate-cistec.openehr.medicationorder.v1.html).

### Validity period: start and stop times

Two requirements shape how time is stored:

- An order must be queryable by its validity period without having to open every therapeutic direction.
- One order can contain several therapeutic directions, and each of them can have its own validity period (for example a tapering scheme, see [Example 4](examples.html#4-tapering-dose-consecutive-therapeutic-directions)).

As a result, the start and the stop of the validity period are stored redundantly in each composition. The redundancy is deliberate. It keeps queries simple at the cost of a few extra elements.

| Element | FLAT path | RM origin | Scope |
|---|---|---|---|
| **Start** | | | |
| Context start time | `medication_order/context/start_time` | `EVENT_CONTEXT.start_time` | Whole order |
| Order start date/time | `…/order/order_details/order_start_date_time` | `INSTRUCTION.medication_order.v3`, `at0012` | Whole order |
| Status time | `medication_order/status/time` | `ACTION.time` | Whole order (status timestamp) |
| Therapeutic direction start date/time | `…/order/<direction>:n/therapeutic_direction_start_date_time` | `CLUSTER.therapeutic_direction.v1`, `at0178` | One direction |
| **Stop** | | | |
| Context end time | `medication_order/context/_end_time` | `EVENT_CONTEXT.end_time` | Whole order |
| Order stop date/time | `…/order/order_details/order_stop_date_time` | `INSTRUCTION.medication_order.v3`, `at0013` | Whole order |
| Therapeutic direction stop date/time | `…/order/<direction>:n/therapeutic_direction_stop_date_time` | `CLUSTER.therapeutic_direction.v1`, `at0179` | One direction |
{:.grid}

Set the values as follows:

- **One therapeutic direction:** the four start elements carry the same value, and the three stop elements carry the same value.
- **Several therapeutic directions:** each direction carries its own start and stop. The order-level start elements (context start time, order start date/time, status time) carry the **earliest** direction start. The order-level stop elements (context end time, order stop date/time) carry the **latest** direction stop.
- **Open-ended order:** leave all stop elements empty.

The start time is therefore the start of the period in which this composition is valid. It is not the time at which the order was recorded. The time of recording is in the commit audit of the composition version (`VERSION.commit_audit.time_committed`), which the CDR sets.

`ACTION.time` is normally the time an action was performed. In this template it carries the start of the order's validity period instead, so that the Status ACTION and the INSTRUCTION share one timestamp (see [Known Issues](known-issues.html#modelling-decisions-to-be-aware-of)).

### Order of therapeutic directions

When an order contains different kinds of therapeutic direction, they must appear in the composition **in the same order as in the template**. CDRs have been seen to reject compositions in which, for example, a `conditional` direction comes before a `schema` direction. The order is:

1. Once (`once`)
2. Periodically (`periodically`)
3. Schema (`schema`)
4. Day plan (`day_plan`)
5. Week plan (`week_plan`)
6. Conditional (`conditional`)
7. Rate therapy (`rate_therapy`)

Several directions of the same kind (e.g. `schema:0` and `schema:1`) are kept together and ordered by their start date/time.

This matters mainly for clients that build canonical JSON or XML compositions. When a FLAT or STRUCTURED composition is submitted, the CDR builds the tree from the web template, which normally gives the template order.

### Identifiers

| Identifier | Where | Rule |
|---|---|---|
| Composition UID | `medication_order/_uid` (set by the CDR on creation) | Identifies one composition. It must never be reused as an order identifier |
| Order sequence ID | `medication_order/medication_order/order_sequence_id` | Identifies the clinical order. **All compositions that describe the same order, at different times or in different states, share this ID.** See [Order Lifecycle](lifecycle.html) |
| Derived from / derives to order sequence ID | `…/derived_from_order_sequence_id:n`, `…/derives_to_order_sequence_id:n` | Link to a *different* order that this order replaces or is replaced by |
| Order group ID | `…/order_group_id:n` | Groups orders that belong together. An order can be in several groups |
{:.grid}

The **Status** ACTION is a separate entry, so it must repeat all four kinds of identifier with **exactly** the same values as the INSTRUCTION (`medication_order/status/order_sequence_id`, `…/derived_from_order_sequence_id:n`, and so on). Queries that join an order to its status depend on this.

The ordering clinician and the person who entered the order may differ. The composer is the person who recorded the composition. If the ordering clinician is someone else, record them as a participation of the composition context with the function *requester*.

### Dose that refers to a substance

A product can contain more than one active substance (for example paracetamol and codeine). When the dose is given in an SI unit such as mg, the order must state which substance the amount refers to. This is needed both for an unambiguous audit trail and to convert the dose between units later. Two elements do this:

1. **`reference_substance`** in each `CLUSTER.dosage.v2` (e.g. `once:0/dosage/reference_substance`, `rate_therapy/rate/reference_substance`). It holds the substance name (hospINDEX `NAMD`). The element is a `DV_TEXT`, so it can also be sent as a `DV_CODED_TEXT` with the hospINDEX substance number (`SUBNO`) as the code:

   ```json
   "medication_order/medication_order/order/once:0/dosage/dose|magnitude": 4000,
   "medication_order/medication_order/order/once:0/dosage/dose|unit": "mg",
   "medication_order/medication_order/order/once:0/dosage/reference_substance|code": "100006",
   "medication_order/medication_order/order/once:0/dosage/reference_substance|value": "Amoxicillin",
   "medication_order/medication_order/order/once:0/dosage/reference_substance|terminology": "hospindex_SUBNO"
   ```

2. **`unit_conversion_reference`** in the protocol ([unit_conversion_reference_cistec.v1](StructureDefinition-openEHR-EHR-CLUSTER.unit-conversion-reference-cistec.v1.html)). It points to the entries of the hospital's unit-conversion table (`unit_id`, `substance_id`) that govern conversions between the order units available for the product. It is only needed when a reference substance is set.

When the dose is given in a presentation unit such as `Stk` (piece), no reference substance is needed.

The substance on which the dose calculation is based is also flagged in the medication details with `dose_lead/is_dose_lead = true` (see [Medication details](template.html#structuring-the-medication-details)).

### Conditional (reserve) administration

A *conditional* direction is given only when a condition is met, for example "if systolic blood pressure > 180 mmHg". It is different from **as required** (`as_required = true`), which flags a scheduled administration that is offered at its planned time and given only if the patient needs or wants it.

The condition is recorded in up to three ways. Use the first one always and the other two as available.

#### 1. Human-readable criterion (always)

`conditional:n/dosage/timing/conditional_criterion` (`DV_TEXT`) holds the condition as text, e.g. "Body temperature > 38.5 °C". Keep this text even when the condition is also stored in a structured form: it is what other systems and people can read without knowing the rule formats.

#### 2. Link to a rule in a workflow engine

Some conditions can be checked automatically, e.g. against charted vital signs, by a rule or workflow engine. The order then needs to point to the rule. No separate data element is used for this. Instead, the ID of the rule is stored in the **feeder audit** of the `conditional_criterion` element:

| Feeder audit attribute | Content |
|---|---|
| `originating_system_audit/system_id` | The system that created the entry, e.g. the ordering application |
| `originating_system_audit/provider` | The rule engine: its name, and its version as an identifier |
| `originating_system_item_id` | The ID of the rule in the rule engine, with type "Medication criterion" |
{:.grid}

```json
"…/conditional:0/dosage/timing/is_conditional": true,
"…/conditional:0/dosage/timing/conditional_criterion": "Body temperature > 38.5 °C",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_audit|system_id": "KISIM",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_audit/provider|name": "Clinical workflow engine",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_audit/provider/_identifier:0|id": "1.3.2",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_audit/provider/_identifier:0|type": "Workflow engine version",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_item_id:0|id": "5f0c2d7e-8a41-4c3b-9b6e-2d1f7a9e4c10",
"…/conditional:0/dosage/timing/conditional_criterion/_feeder_audit/originating_system_item_id:0|type": "Medication criterion"
```

<div class="stu-note" markdown="1">
**FLAT differences between CDRs.** EHRbase and Better write `DV_IDENTIFIER` differently in FLAT. EHRbase uses the attribute name, as above (`…/_identifier:0|id`, `…/originating_system_item_id:0|id`). Better omits it for the `id` attribute (`…/_identifier:0`, `…/originating_system_item_id:0`). The other attributes (`|type`, `|issuer`, `|assigner`) are written the same way. Generate FLAT for the CDR you target, or use canonical JSON.
</div>

#### 3. Structured rule

The condition can also be stored in a machine-processable form with [CLUSTER.conditional_medication_rules_cistec.v1](downloads.html#archetypes), attached to the conditional direction. The archetype has two levels:

- **Condition rule – AND** (`condition_rule_-_and`): one rule, i.e. a `condition_name` and the `condition` it must satisfy. The condition can be a quantity, count, proportion, text, boolean or an interval of quantities or counts.
- **Conditional medication instructions – OR** (`conditional_medication_instructions_-_or`): a group of rules. All rules within a group must be met (AND). The condition as a whole is met if any one group is met (OR).

So "(A and B) or C" is two OR-groups, the first with two AND-rules and the second with one. A threshold with a comparison operator is written as a quantity, with the operator in `magnitude_status`:

```json
"…/conditional:0/conditional_medication_instructions_-_or:0/condition_rule_-_and:0/condition_name": "Systolic blood pressure",
"…/conditional:0/conditional_medication_instructions_-_or:0/condition_rule_-_and:0/condition/quantity_value|magnitude": 180,
"…/conditional:0/conditional_medication_instructions_-_or:0/condition_rule_-_and:0/condition/quantity_value|unit": "mm[Hg]",
"…/conditional:0/conditional_medication_instructions_-_or:0/condition_rule_-_and:0/condition/quantity_value|magnitude_status": ">"
```

A range is written as an interval, e.g. a pain score from 5 to 10 as `interval_of_count_value` (see [Example 3](examples.html#3-as-needed-subcutaneous-opioid-conditional)).

When a structured rule is stored, the human-readable `conditional_criterion` and, if there is one, the link to the workflow engine are still recorded.

Several conditional directions can be ordered for one patient, e.g. a first and a second reserve medication for pain. `conditional:n/priority` ranks them (1 = first choice).

### Values that the RM cannot store as entered

Two kinds of user input cannot be stored as entered. In both cases the value is stored in its normalised form, and the value as entered goes into the **feeder audit** of the element (`_feeder_audit/original_content`, with its `formalism`). `originating_system_audit|system_id` is mandatory whenever a feeder audit is present.

#### Durations with decimals or unusual units

openEHR `DV_DURATION` allows a decimal fraction only in the seconds component. In addition, some CDRs (EHRbase among them) normalise durations, e.g. `PT120M` is stored and returned as `PT2H`. Users can still enter "every 0.5 days" or "every 120 minutes", and the order should show what they entered. Store the normalised duration and keep the original:

```json
"…/periodically:0/dosage/timing_-_daily/repetition_interval_for_hours_and_minutes": "PT12H",
"…/periodically:0/dosage/timing_-_daily/repetition_interval_for_hours_and_minutes/_feeder_audit/originating_system_audit|system_id": "KISIM",
"…/periodically:0/dosage/timing_-_daily/repetition_interval_for_hours_and_minutes/_feeder_audit/original_content": "P0.5D",
"…/periodically:0/dosage/timing_-_daily/repetition_interval_for_hours_and_minutes/_feeder_audit/original_content|formalism": "ISO8601_duration"
```

`P0.5D` is a valid ISO 8601 duration (ISO 8601 allows a decimal fraction on the smallest component), but it is not a valid openEHR `DV_DURATION`.

#### Infusion rates entered as mass per time

`rate_therapy/rate/administration_rate` is stored in **volume per time** only (`ml/h`, `ml/min`, …). If the clinician orders a rate in mass or units per time (e.g. µg/min or IE/h), the ordering system converts it to volume per time using the concentration of the mixture. The rate as entered is kept in the feeder audit of the `administration_rate` element, as a UCUM expression:

```json
"…/rate_therapy/rate/administration_rate/quantity_value|magnitude": 2,
"…/rate_therapy/rate/administration_rate/quantity_value|unit": "ml/h",
"…/rate_therapy/rate/administration_rate/_feeder_audit/originating_system_audit|system_id": "KISIM",
"…/rate_therapy/rate/administration_rate/_feeder_audit/original_content": "1000.[iU]/h",
"…/rate_therapy/rate/administration_rate/_feeder_audit/original_content|formalism": "UCUM"
```

UCUM allows only integer factors in front of a unit. A decimal value must be written as a fraction: 1.2 µg/min becomes `6/5.ug/min`.

### Minimum and maximum infusion rate

A rate therapy can allow the rate to be adjusted within limits, e.g. "2 ml/h, adjustable between 1 and 4 ml/h". `CLUSTER.dosage.v2` has no element for these limits. They are stored as a reference range on the rate quantity itself, using the RM attribute `DV_QUANTITY.other_reference_ranges`, with the meaning "Limits":

```json
"…/rate_therapy/rate/administration_rate/quantity_value|magnitude": 2,
"…/rate_therapy/rate/administration_rate/quantity_value|unit": "ml/h",
"…/rate_therapy/rate/administration_rate/quantity_value/_other_reference_ranges:0/meaning": "Limits",
"…/rate_therapy/rate/administration_rate/quantity_value/_other_reference_ranges:0/lower|magnitude": 1,
"…/rate_therapy/rate/administration_rate/quantity_value/_other_reference_ranges:0/lower|unit": "ml/h",
"…/rate_therapy/rate/administration_rate/quantity_value/_other_reference_ranges:0/upper|magnitude": 4,
"…/rate_therapy/rate/administration_rate/quantity_value/_other_reference_ranges:0/upper|unit": "ml/h"
```

The limits use the same unit as the rate. The meaning is free text for now. A coded list of reference-range meanings may follow. [Example 2](examples.html#2-continuous-iv-infusion-with-bolus-rate-therapy) uses both the limits and the original-content pattern.

### Timing of the scheduled positions

For the positions of a **schema** (morning, noon, evening, night), a time window (`time_period_for_application/interval_of_time_value`, e.g. 06:00–10:00) is preferred over an exact time (`time_value`). It tells the ward when the dose is due without implying a precision that is not intended. The template's default exact times (06:00, 12:00, 18:00, 23:59:59) are only a fallback.

A position that is not given (the zeros in 1-0-1-0) is left out. It can also be sent with a dose of 0, but leaving it out is clearer.
