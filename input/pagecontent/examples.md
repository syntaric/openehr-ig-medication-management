The examples below are complete compositions for `cistec.openehr.medication_order.v1` in the **FLAT** (simplified data template) JSON format. This format is accepted by openEHR CDRs such as EHRbase and Better, e.g. `POST /rest/ecis/v1/composition?format=FLAT&templateId=cistec.openehr.medication_order.v1`. They are illustrative. Products, hospINDEX numbers, identifiers and people are fictitious.

How to read the FLAT keys:

- Each key is the path of web-template ids from the [WebTemplate](WebTemplate-cistec.openehr.medicationorder.v1.html) root, e.g. `medication_order/medication_order/order/route|code`.
- Nodes that can repeat carry a zero-based index (`schema:0`, `substance:0`, `knowledge_base_reference:1`).
- `|code`, `|value`, `|terminology`, `|magnitude`, `|unit`, `|id` and so on address the attributes of a data value. Durations are ISO 8601 strings (`P1D`, `PT4H`).
- Path segments that start with an underscore (`_end_time`, `_feeder_audit`, `_other_reference_ranges`) address Reference Model attributes that are not in the web template. Their use is explained on the [Implementation Guidance](implementation.html) page.
- `subject` is omitted in all examples. CDRs then default it to `PARTY_SELF`.

All keys were checked against the web template: each id path exists, indices match the occurrences, codes and units come from the template lists, and every mandatory node of every populated parent is present.

All examples follow the [start/stop rules](implementation.html#validity-period-start-and-stop-times): the context start time, order start date/time, status time and the earliest therapeutic-direction start carry the same value, and so do the stop elements.

### 1. Oral tablet on a fixed daily schema (1-0-1-0)

Paracetamol 500 mg tablets, one in the morning (08:00) and one in the evening (18:00), for five days, with a safety limit of 4000 mg per day.

- `medication_details` is a *Single-ingredient product* with one `substance` (Paracetamol, 500 mg per tablet). The substance is flagged as `dose_lead`.
- hospINDEX references: the product (`PRDNO`) and the article (`Pharmacode`) on the medication, and the substance (`SUBNO`) on the substance.
- Route `20053000` (oral) and administration method `0019` (swallowing).
- The `schema:0` therapeutic direction fills only `morning` and `evening`. `noon` and `night` (the zeros in 1-0-1-0) are simply absent.
- `medication_safety/maximum_dose:0` limits the dose to 4000 mg per `P1D`.
- The order is valid from the time it is recorded (09:15) until 24 October, 08:00. The first dose follows from the schema: the evening dose at 18:00.
- The status is *active* (`245`), via careflow step *Medication order issued* (`at0002`).

```json
{% include example-oral-schema.json %}
```

### 2. Continuous IV infusion with bolus (rate therapy)

Heparin 25,000 IE made up in NaCl 0.9% to 50 ml (500 IE/ml), given by syringe pump through a peripheral line: a 5000 IE bolus over 2 minutes, then 2 ml/h (1000 IE/h).

- `medication_details` is an *Ad-hoc mixture* of:
  - a `medication_component` (the heparin product, 5 ml), whose `substance` (heparin sodium, 25,000 IE) is the `dose_lead`;
  - a `carrier_solution` (NaCl 0.9%, 45 ml) with the role *Excipient* and a `carrier_solution_selection` ([mixture_medium_selection_cistec.v1](StructureDefinition-openEHR-EHR-CLUSTER.mixture-medium-selection-cistec.v1.html)). The medium is *Required*, belongs to option group `CARRIER-OPTION-1`, and the selection rule is *Exactly one option*.
- Route `20045000` (intravenous) and method `0009` (infusion), through an `installation` (peripheral venous catheter) with a single `lumen` of type SNOMED CT `257369004` *Single lumen tube*.
- `rate_therapy` (0..1, so no index) gives the `administration_rate` 2 `ml/h` and the equivalent `dose_formula` 1000 IE/h, plus a `bolus` of 5000 IE with an `administration_duration` of `PT2M`.
- The rate may be adjusted between 1 and 4 ml/h. These [limits](implementation.html#minimum-and-maximum-infusion-rate) are a reference range with the meaning "Limits" on the rate quantity.
- The physician ordered 1000 IE/h. The rate is stored in ml/h, and the rate as entered is kept as the [original content](implementation.html#infusion-rates-entered-as-mass-per-time) of the feeder audit (`1000.[iU]/h`, UCUM).
- The protocol `unit_conversion_reference:0` points to the unit and substance conversion records, with `referenced_dose = DEFAULT`.

```json
{% include example-iv-rate-therapy.json %}
```

### 3. As-needed subcutaneous opioid (conditional)

Morphine hydrochloride 2-4 mg subcutaneously for breakthrough pain, only when the pain score (NRS) is above 4, at least 4 hours apart, and at most 24 mg per day, for 3 days.

- `conditional:0` has `priority` 1 and a dose given as a **range** (`interval_of_quantity_value` 2-4 mg).
- `dosage/timing` sets `is_conditional = true` (fixed by the template), a `minimum_interval` of `PT4H` and a human-readable `conditional_criterion`.
- The machine-readable rule uses `conditional_medication_instructions_-_or:0/condition_rule_-_and:0`: the condition "Pain score (NRS 0-10)" is satisfied by a count in the interval 5..10. More AND-rules in the same OR-group, or more OR-groups, can express compound conditions.
- `medication_safety/maximum_dose:0` limits the dose to 24 mg per `P1D`.
- Route `20066000` (subcutaneous) and method `0011` (injection).

```json
{% include example-conditional-prn.json %}
```

### 4. Tapering dose (consecutive therapeutic directions)

Prednisone 20 mg tablets: one tablet every 8 hours for 3 days, then 1-0-1-0 for 4 days, then ½-0-½-0 for 14 days.

- Each step of the taper is its own therapeutic direction with its own start and stop: `periodically:0`, then `schema:0` and `schema:1`. Each step starts when the previous one stops.
- The directions appear in [template order](implementation.html#order-of-therapeutic-directions): `periodically` before `schema`. The two `schema` directions are ordered by start time.
- `periodically:0` repeats every `PT8H`, with the first dose at 06:00.
- The schema positions use time windows (06:00–10:00, 16:00–20:00) rather than exact times. The half tablets are a dose of `0.5` `Stk`.
- The order-level start (context start time, order start date/time, status time) is the start of `periodically:0`. The order-level stop (context end time, order stop date/time) is the stop of `schema:1`.
- The taper crosses the end of daylight saving time (25 October 2026), so the UTC offset changes from `+02:00` to `+01:00`.

```json
{% include example-consecutive-directions.json %}
```

### 5. Regular dose as required plus reserve dose (overlapping therapeutic directions)

Paracetamol 500 mg tablets for postoperative pain, 1-1-1-0 **as required** for a week. In addition, for three days, one tablet **in reserve** whenever the body temperature is above 38.5 °C, at least 6 hours apart. Not more than 4000 mg per day in total.

- `schema:0` sets `as_required = true` on each of its three positions. The nurse offers the dose at each planned time, and it is given only if the patient needs it.
- `conditional:0` has no planned times. It applies whenever its condition is met, at most every `PT6H`. Both directions are valid at the same time, and `conditional` comes after `schema` as the template requires.
- The condition is recorded [three ways](implementation.html#conditional-reserve-administration):
  - as text in `conditional_criterion`;
  - as a link to the rule in a workflow engine, in the feeder audit of `conditional_criterion` (EHRbase FLAT notation);
  - as a structured rule: body temperature, `38.5` `Cel` with `magnitude_status` `>`.
- The order runs until the later of the two stops, i.e. the end of `schema:0`. `conditional:0` ends three days earlier.

```json
{% include example-overlapping-directions.json %}
```

### Status changes and changes to an order

Pausing, reactivating, correcting or stopping an order is not done by editing the Status ACTION alone. Depending on the change, the composition is updated in place or closed and replaced by a new composition with the same `order_sequence_id`. In both cases the start/stop elements and the status of the affected compositions are kept consistent. The [Order Lifecycle](lifecycle.html) page walks through eight typical changes.

For example, the composition that is closed when the order from example 1 is changed on 21 October at 07:30 gets these new values:

```json
{
  "medication_order/context/_end_time": "2026-10-21T07:30:00+02:00",
  "medication_order/medication_order/order/schema:0/therapeutic_direction_stop_date_time": "2026-10-21T07:30:00+02:00",
  "medication_order/medication_order/order/order_details/order_stop_date_time": "2026-10-21T07:30:00+02:00",
  "medication_order/status/ism_transition/current_state|code": "531",
  "medication_order/status/ism_transition/current_state|value": "aborted",
  "medication_order/status/ism_transition/current_state|terminology": "openehr",
  "medication_order/status/ism_transition/careflow_step|code": "at0039",
  "medication_order/status/ism_transition/careflow_step|value": "Major change to order",
  "medication_order/status/ism_transition/careflow_step|terminology": "local",
  "medication_order/status/reason:0": "Patient nil by mouth before surgery"
}
```

The new composition that takes over keeps `ORD-2026-000101` as its `order_sequence_id`. All its start elements are `2026-10-21T07:30:00+02:00`, and its status is *suspended* (`530`, careflow step `at0009` *Medication order suspended*).

In this template the INSTRUCTION and the Status ACTION are both mandatory (1..1), so a composition that contains only a status cannot be stored.
