This page summarises the code systems and value lists that the template uses. Lists defined by **local at-codes** in the archetypes are also published as `CodeSystem` and `ValueSet` resources on the [Artifacts](artifacts.html) page. External lists (EDQM, units) exist only as template constraints, and are reproduced here from the [WebTemplate](WebTemplate-cistec.openehr.medicationorder.v1.html).

### EDQM Standard Terms

Route and administration method use EDQM Standard Terms, which are also used for these elements in FHIR-based exchange formats such as the Swiss CH EMED. This makes mapping between the two straightforward.

#### Route of administration

`order/route` (1..1) is constrained to **83 EDQM route codes**. The template default is `20053000`. The labels are the German EDQM terms, as in the template (see [Known Issues](known-issues.html#source-template-review)).

| Code | Label | Code | Label | Code | Label |
|---|---|---|---|---|---|
| `20001000` | Anwendung am Ohr | `20027010` | Intrazerebrale Anwendung | `20049000` | nasale Anwendung |
| `20002500` | Buccale Anwendung | `20028000` | intrazervikale Anwendung | `20051000` | Anwendung am Auge |
| `20003000` | Anwendung auf der Haut | `20028300` | zur Anwendung in der Cholangiopankreatikographie | `20053000` | zum Einnehmen |
| `20004000` | dentale Anwendung | `20028500` | intracisternale Anwendung | `20054000` | Anwendung in der Mundhöhle |
| `20006000` | endozervikale Anwendung | `20029000` | intrakoronare Anwendung | `20055000` | zur Anwendung im Mund- und Rachenraum |
| `20007000` | Anwendung in den Nebenhöhlen | `20030000` | intradermale Anwendung | `20057000` | periartikuläre Anwendung |
| `20008000` | endotracheopulmonale Anwendung | `20031000` | intradiskale Anwendung | `20058000` | perineurale Anwendung |
| `20009000` | epidurale Anwendung | `20031500` | intraepidermale Anwendung | `20059000` | zur periodontalen Anwendung |
| `20010000` | zum Auftragen auf die Wunde | `20031700` | intraglanduläre Anwendung | `20059300` | periossäre Anwendung |
| `20011000` | extraamniotische Anwendung | `20032000` | intraläsionale Anwendung | `20059400` | peritumorale Anwendung |
| `20011500` | extrakorporale Anwendung | `20033000` | intralymphatische Anwendung | `20059500` | posteriore juxtasclerale Anwendung |
| `20087000` | extrapleurale Anwendung | `20035000` | intramuskuläre Anwendung | `20061000` | rektale Anwendung |
| `20013000` | gastrointestinale Anwendung | `20036000` | intraokulare Anwendung | `20061500` | retrobulbäre Anwendung |
| `20013500` | zur Anwendung mittels Magensonde | `20036500` | intraossäre Anwendung | `20062000` | Art der Anwendung nicht spezifizierbar |
| `20014000` | Anwendung am Zahnfleisch | `20037000` | Intraperikardial | `20063000` | Einritzen der Haut |
| `20015000` | Hämodialyse | `20038000` | intraperitoneale Anwendung | `20065000` | subkonjunktivale Anwendung |
| `20015500` | zur Implantation | `20039000` | intrapleurale Anwendung | `20066000` | subkutane Anwendung |
| `20019500` | Infiltration | `20039200` | intraportale Anwendung | `20067000` | Sublingual |
| `20020000` | zur Inhalation | `20039500` | intraprostatische Anwendung | `20067500` | submuköse Anwendung |
| `20021000` | intestinale Anwendung | `20041000` | intrasternale Anwendung | `20070000` | transdermale Anwendung |
| `20022000` | intraamniotische Anwendung | `20042000` | intrathekale Anwendung | `20071000` | Anwendung in der Harnröhre |
| `20023000` | intraarterielle Anwendung | `20043000` | intratumorale Anwendung | `20072000` | vaginale Anwendung |
| `20024000` | intraartikuläre Anwendung | `20044000` | intrauterine Anwendung | `20080000` | intracerebroventrikuläre Anwendung |
| `20025000` | intrabursale Anwendung | `20045000` | intravenöse Anwendung | `20081000` | subretinale Anwendung |
| `20025500` | intrakamerale Anwendung | `20046000` | intravesikale Anwendung | `20084000` | intracorneale Anwendung |
| `20026000` | intracardiale Anwendung | `20047000` | Intravitreal | `20086000` | Intraputaminale Anwendung |
| `20026500` | intrakartilaginäre Anwendung | `20047500` | zur Iontophorese | `20088000` | periläsionale Anwendung |
| `20027000` | intrakavernöse Anwendung | `20048000` | zur Anwendung im Rachen und am Kehlkopf |  |  |
{:.grid}

#### Administration method

`order/administration_method` (0..1) is constrained to **19 EDQM administration method codes**. The template default is `0004`.

| Code | Label | Code | Label |
|---|---|---|---|
| `0004` | Administration | `0014` | Orodispersion |
| `0005` | Applikation | `0015` | Spülen/Waschen |
| `0006` | Baden | `0017` | Sprühen |
| `0007` | Kauen | `0018` | Lutschen |
| `0008` | Gurgeln | `0019` | Schlucken |
| `0009` | Infusion | `0020` | Keine Angaben |
| `0010` | Inhalation | `0111` | Brennen |
| `0011` | Injektion | `0112` | Dialyse |
| `0012` | Insertion | `0113` | Implantation |
| `0013` | Instillation |  |  |
{:.grid}

### openEHR terminology

| Where | Code | Rubric |
|---|---|---|
| `category` | `433` | event |
| `context/setting` | e.g. `238` | other care (any openEHR setting code) |
| `status/ism_transition/current_state` | `245` | active |
| | `530` | suspended |
| | `531` | aborted |
| | `532` | completed |
| | `528` | cancelled |
{:.grid}

The mapping of careflow steps to ISM states is shown on the [template page](template.html#status).

Changes to an order are also distinguished by the **audit change type** of the composition version, which the CDR records in `VERSION.commit_audit.change_type`: `249` creation for a new composition and `251` modification for a new version of an existing one (see [Order Lifecycle](lifecycle.html)).

### Local at-code value sets

| Element | Codes | Archetype | ValueSet |
|---|---|---|---|
| Medication `category` | `at0143` Ad-hoc mixture, `at0144` Multi-ingredient product, `at0145` Single-ingredient product, `at0001` Combination product, `at0146` Ingredient | CLUSTER.medication.v2 | [Category](ValueSet-openEHR-EHR-CLUSTER.medication.v2.at0142.html) |
| Substance `role` | `at0080` Therapeutic, `at0083` Adjuvant, `at0084` Excipient | CLUSTER.medication.v2 | [Role](ValueSet-openEHR-EHR-CLUSTER.medication.v2.at0127.html) |
| `medium_use` | `at0002` Required, `at0003` Alternative | CLUSTER.mixture_medium_selection_cistec.v1 | [Medium use](ValueSet-openEHR-EHR-CLUSTER.mixture-medium-selection-cistec.v1.at0001.html) |
| `selection_rule` | `at0007` Exactly one option, `at0008` One or more options | CLUSTER.mixture_medium_selection_cistec.v1 | [Selection rule](ValueSet-openEHR-EHR-CLUSTER.mixture-medium-selection-cistec.v1.at0006.html) |
| `specific_day_of_week` | `at0007` Monday, `at0008` Tuesday, `at0016` Wednesday, `at0017` Thursday, `at0018` Friday, `at0019` Saturday, `at0020` Sunday | CLUSTER.timing_nondaily.v1 | [Specific day of week](ValueSet-openEHR-EHR-CLUSTER.timing-nondaily.v1.at0003.html) |
| `unit_type` (obsolete) | `at0005` SubstanceQuantityUnit, `at0006` BaseQuantityUnit, `at0007` ProprietaryQuantityUnit, `at0008` StandardQuantityUnit, `at0009` FallbackUnit | CLUSTER.unit_conversion_reference_cistec.v1 | [Unit type](ValueSet-openEHR-EHR-CLUSTER.unit-conversion-reference-cistec.v1.at0002.html) |
| `careflow_step` | see [template page](template.html#status) | ACTION.medication.v1 | (not rendered) |
{:.grid}

The template narrows some of these lists depending on context. For example, a `substance` must have category `at0146` Ingredient, and the `role` of a solvent or carrier solution is limited to `at0084` Excipient. The WebTemplate shows the narrowed list at each node.

### SNOMED CT

The template uses a single SNOMED CT concept: **`257369004` Single lumen tube**, as the only allowed (and default) value of `installation/lumen/type`.

### Units

Dose quantities in `once`, `periodically`, `schema`, `day_plan`, `week_plan` and `conditional` are constrained to **40 units**. These combine hospital-specific presentation units (`KISIM`), HCI hospINDEX dosage-form units (`HCI hospINDEX CDTYP9`) and UCUM units:

`Anw`, `Blist`, `Btl`, `Dos`, `Dosierpip`, `Dosierspr`, `EL`, `Fl`, `Tropf`, `Hub`, `MB`, `ML`, `Pck`, `Pfl`, `Stk`, `Tube`, `Teilpck`, `TL`, `N/A`, `E`, `Mio E`, `IE`, `Mio IE`, `ng`, `mcg`, `mg`, `g`, `ml`, `nmol`, `mcmol`, `mmol`, `ppm`, `J`, `kJ`, `cal`, `kcal`, `Bq`, `kBq`, `MBq`, `GBq`

The units declared as UCUM are `ng`, `mcg`, `mg`, `g`, `ml`, `nmol`, `mcmol`, `mmol`, `ppm`, `J`, `kJ`, `cal`, `kcal`, `Bq`, `kBq`, `MBq` and `GBq`. The KISIM units are `Anw`, `Tropf`, `ML`, `Tube`, `E`, `Mio E`, `IE` and `Mio IE`. All other units are hospINDEX CDTYP9.

Infusion rates (`rate_therapy/rate/administration_rate`) use `l/d`, `l/h`, `ml/h`, `ml/min`, `ml/s` and `ml/d`. Other quantities (strengths, amounts, maximum dose, bolus) are not unit-constrained.

### hospINDEX references

Products, articles and substances are identified through [CLUSTER.knowledge_base_reference.v1](StructureDefinition-openEHR-EHR-CLUSTER.knowledge-base-reference.v1.html) against **HCI Solutions hospINDEX**, the Swiss hospital drug database:

| Field | Usage in this template |
|---|---|
| `knowledge_base_name` | Fixed to `hospindex` (single allowed value, also the default) |
| `knowledge_base_version` | Version of the hospINDEX release, optional |
| `code_name` | The kind of hospINDEX key: `PRDNO` for products, `SUBNO` for substances, `Pharmacode` for articles (packs) |
| `item_uri` | Reference to the item, in the form `hospindex/<version>/<id>`, e.g. `hospindex/2033-05/777630` (the template's own example) |
{:.grid}

Text fields follow hospINDEX naming as well. `medication_item` and the medication `name` carry the product or article description (`DSCRD`), and substance names carry `NAMD`/`NAMED`/`CNAMED`.

The `reference_substance` of a dose holds the substance name (`NAMD`). It may be sent as a coded text with the substance number (`SUBNO`) as the code, see [Dose that refers to a substance](implementation.html#dose-that-refers-to-a-substance).

### Codes in data values outside the template constraints

Some elements are free text or unconstrained in the template, but are filled with codes from a known system by convention:

| Where | Code system | Usage |
|---|---|---|
| `…/dosage/reference_substance` (and in `rate`, `bolus`, schema positions, …) | hospINDEX `SUBNO` | Optional coding of the substance the dose refers to |
| `order/body_site` | SNOMED CT (body structure) | Optional coding of the site of administration |
| `…/_feeder_audit/original_content` of `administration_rate` | UCUM (`formalism` = `UCUM`) | Infusion rate as entered, e.g. `1000.[iU]/h` |
| `…/_feeder_audit/original_content` of a duration | ISO 8601 (`formalism` = `ISO8601_duration`) | Duration as entered, e.g. `P0.5D` |
| `…/_other_reference_ranges:n/meaning` of `administration_rate` | free text, `Limits` | Minimum and maximum infusion rate |
| `condition/quantity_value` in structured conditions | UCUM units, e.g. `mm[Hg]`, `Cel`; `magnitude_status` as operator (`<`, `>`, `<=`, `>=`, `=`) | Thresholds of conditional rules |
{:.grid}

The use of these elements is described on the [Implementation Guidance](implementation.html) page.
