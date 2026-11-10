A medication order changes many times during an inpatient stay: the dose is adjusted, the order is paused for an operation and resumed, the stop date is set. This page shows how these changes are recorded with `cistec.openehr.medication_order.v1`, and walks through a typical sequence of changes step by step. It builds on the rules for start/stop times and identifiers on the [Implementation Guidance](implementation.html) page.

### One order, several compositions

A composition of this template describes the order **for one period of time and in one state**. The clinical order itself is identified by the **order sequence ID** (`order_sequence_id`), not by the composition UID. An order that changes over time is therefore stored as a series of compositions that share the same order sequence ID. Each composition covers its own period, given by its start and stop elements, and each has its own status.

This keeps the history clinically readable. What was ordered at any point in time is found by asking which composition of the order was valid at that time, without replaying the version history of a single composition.

### Two ways to record a change

| | Update in place | Close and replace |
|---|---|---|
| What happens | A new **version** of the existing composition is committed | The existing composition is **closed** (new version) and a **new composition** is created |
| REST | `PUT /ehr/{ehr_id}/composition/{uid}` | `PUT` for the old composition and `POST /ehr/{ehr_id}/composition` for the new one, or both in one `POST /ehr/{ehr_id}/contribution` |
| Audit change type | `251` modification | `251` modification (old) and `249` creation (new) |
| Composition UID | Unchanged, version number increases | New composition with a new UID, version 1 |
| Order sequence ID | Unchanged | **Unchanged**: the new composition keeps the order sequence ID |
{:.grid}

**Update in place** is used for changes that only affect the future, or that do not change what is administered:

- the start or stop date/time, as long as it lies in the future;
- the comment;
- the dose and unit, as long as the start of the composition lies in the future.

**Close and replace** is used for changes that take effect now, such as changing the dose or schema of a running order, pausing it, reactivating it or correcting it. The old composition is closed as follows:

- All stop elements (context end time, order stop date/time and the stop of each open therapeutic direction) are set to the time of the change.
- The status is set to *aborted* (`531`), with careflow step *Major change to order* (`at0039`) and a free-text `reason`.

The new composition then starts at the time of the change: all its start elements carry that time.

When a change produces more than one composition version, commit them in **one contribution**, so that the order is never seen in an inconsistent state.

<div class="stu-note" markdown="1">
Not every kind of change has been assigned to one of the two methods yet. In particular, it is still open whether **status changes** (pause, reactivation, stop) are recorded by updating the composition in place or by closing and replacing it. The scenario below closes and replaces for "pause now" and "reactivate", and updates in place for "stop now". See [Known Issues](known-issues.html#open-questions).
</div>

### Scenario: paracetamol 1-1-1-1

The scenario follows a simple order for paracetamol (Dafalgan 500 mg) through eight changes. In the tables, *t0* is Monday 2 November 2026, 08:00 (+01:00). C1, C2, … are the compositions in the order they are created. All of them share the order sequence ID `ORD-2026-000201`. Each composition contains one `schema:0` therapeutic direction. "Start" and "stop" mean all start elements and all stop elements as described in [Validity period](implementation.html#validity-period-start-and-stop-times).

#### Summary

| Step | Time | Change | Method | Compositions written |
|---|---|---|---|---|
| 1 | t0 | Order 1-1-1-1 from now, open-ended | create | C1 v1 |
| 2 | t0+24h | Ward round: change to 1-0-0-1 from now | close and replace | C1 v2, C2 v1 |
| 3 | t0+30h | Pause from now, open-ended | close and replace | C2 v2, C3 v1 |
| 4 | t0+48h | Reactivate from now | close and replace | C3 v2, C4 v1 |
| 5 | t0+48h05 | Correction: back to 1-1-1-1 | close and replace | C4 v2, C5 v1 |
| 6 | t0+54h | Set stop in three days (t0+126h) | update in place | C5 v2 |
| 7 | t0+56h | Pause during surgery from t0+72h to t0+78h | update in place and create | C5 v3, C6 v1, C7 v1 |
| 8 | t0+78h | Stop now | update in place | C7 v2 |
{:.grid}

After step 8, the order consists of these compositions:

| Composition | Valid from | Valid to | Schema | Final status |
|---|---|---|---|---|
| C1 | t0 (02.11. 08:00) | t0+24h (03.11. 08:00) | 1-1-1-1 | aborted |
| C2 | t0+24h (03.11. 08:00) | t0+30h (03.11. 14:00) | 1-0-0-1 | aborted |
| C3 | t0+30h (03.11. 14:00) | t0+48h (04.11. 08:00) | 1-0-0-1 | aborted (was suspended) |
| C4 | t0+48h (04.11. 08:00) | t0+48h05 (04.11. 08:05) | 1-0-0-1 | aborted |
| C5 | t0+48h05 (04.11. 08:05) | t0+72h (05.11. 08:00) | 1-1-1-1 | active |
| C6 | t0+72h (05.11. 08:00) | t0+78h (05.11. 14:00) | 1-1-1-1 | suspended |
| C7 | t0+78h (05.11. 14:00) | t0+78h (05.11. 14:00) | 1-1-1-1 | active |
{:.grid}

#### Step 1: create the order

*A physician orders Dafalgan 500 mg, 1-1-1-1, valid from now with an open stop.*

C1 v1 (creation):

| Element | Value |
|---|---|
| `medication_item` | "Dafalgan Brausetabl 500 mg" (hospINDEX `DSCRD`) |
| `schema:0/morning`, `noon`, `evening`, `night` | 1 `Stk` each, with a time window per position |
| Start (context start time, order start, status time, direction start) | t0 |
| Stop (context end time, order stop, direction stop) | not set |
| Status | `245` active, careflow step `at0002` Medication order issued |
{:.grid}

#### Step 2: change the schema

*At the next morning's ward round (t0+24h) another physician changes the schema to 1-0-0-1, effective immediately.*

C1 v2 (modification) closes the old period. Compared with C1 v1, these FLAT keys change:

```json
{
  "medication_order/context/_end_time": "2026-11-03T08:00:00+01:00",
  "medication_order/medication_order/order/schema:0/therapeutic_direction_stop_date_time": "2026-11-03T08:00:00+01:00",
  "medication_order/medication_order/order/order_details/order_stop_date_time": "2026-11-03T08:00:00+01:00",
  "medication_order/status/ism_transition/current_state|code": "531",
  "medication_order/status/ism_transition/current_state|value": "aborted",
  "medication_order/status/ism_transition/careflow_step|code": "at0039",
  "medication_order/status/ism_transition/careflow_step|value": "Major change to order",
  "medication_order/status/reason:0": "Schema changed"
}
```

C2 v1 (creation) is a new composition with the same order sequence ID. `noon` and `night` are left out, and all start elements are t0+24h. The status is active (`245`, `at0002`), and the stop is not set.

#### Step 3: pause from now

*At midday (t0+30h) a senior physician pauses the order. No end of the pause is given.*

- C2 v2 (modification): stop = t0+30h, status aborted (`531`, `at0039`), reason "Status changed".
- C3 v1 (creation): the same schema 1-0-0-1, start = t0+30h, no stop, status **suspended** (`530`, careflow step `at0009` Medication order suspended), reason "Paused".

#### Step 4: reactivate

*The next morning (t0+48h) the ward physician reactivates the order.*

- C3 v2 (modification): stop = t0+48h, status aborted, reason "Status changed".
- C4 v1 (creation): schema 1-0-0-1, start = t0+48h, status active (`245`, `at0002`).

The template does not distinguish a first activation from a reactivation. Both use `at0002` and `245`.

#### Step 5: correct the order

*Five minutes later (t0+48h05) the physician notices a mistake and sets the schema back to 1-1-1-1.*

- C4 v2 (modification): stop = t0+48h05, status aborted, reason "Schema changed".
- C5 v1 (creation): schema 1-1-1-1, start = t0+48h05, status active.

A correction is recorded like any other change. The composition that was valid for five minutes stays in the record.

#### Step 6: set a stop date in the future

*The head of department does not want open-ended orders. At t0+54h they set the order to end in three days, at t0+126h (7 November, 14:00).*

The stop lies in the future, so C5 is **updated in place**. C5 v2 (modification) sets all stop elements to t0+126h. The status does not change.

#### Step 7: pause during surgery

*The patient is to be operated on the next day. An anaesthetist decides at t0+56h that paracetamol is to be paused from t0+72h to t0+78h and then resumed.*

One contribution with three versions:

| Version | Change type | Content |
|---|---|---|
| C5 v3 | modification | Stop brought forward from t0+126h to t0+72h. The status stays active: C5 simply ends when the pause begins |
| C6 v1 | creation | Schema 1-1-1-1, start t0+72h, stop t0+78h, status suspended (`530`, `at0009`) |
| C7 v1 | creation | Schema 1-1-1-1, start t0+78h, stop t0+126h, status active (`245`, `at0002`) |
{:.grid}

Because the pause lies in the future, nothing that was valid up to now is changed. The future is simply split into three periods.

#### Step 8: stop now

*After the operation (t0+78h) it is decided that the patient should not get any more paracetamol.*

C7 v2 (modification) sets all stop elements to t0+78h. C7 now starts and ends at the same time: the order ends where the pause ends.

### Finding the current state of an order

Because each composition covers a period, the state of an order at a given time comes from the composition whose period contains that time. The following AQL lists all periods of one order:

```sql
SELECT c/uid/value AS composition_uid,
       c/context/start_time/value AS valid_from,
       c/context/end_time/value AS valid_to,
       a/ism_transition/current_state/defining_code/code_string AS state
FROM EHR e
  CONTAINS COMPOSITION c[openEHR-EHR-COMPOSITION.request.v1]
    CONTAINS (INSTRUCTION i[openEHR-EHR-INSTRUCTION.medication_order.v3]
              AND ACTION a[openEHR-EHR-ACTION.medication.v1])
WHERE e/ehr_id/value = $ehr_id
  AND i/protocol[at0005]/items[at0004,'Order sequence ID']/value/id = $order_sequence_id
ORDER BY c/context/start_time/value ASC
```

A query for all orders that are valid at a given time compares `c/context/start_time` and `c/context/end_time` (or the order start and stop date/time) with that time. Because the order-level start and stop always cover all therapeutic directions, the directions themselves do not have to be read.
