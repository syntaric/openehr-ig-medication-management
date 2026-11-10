# Template: Medication order

Template Id: **cistec.openehr.medication\_order.v1**

Version: **1.0.0**

Created: **Wed Oct 21 2026**

## Composition: **Medication order**

### Archetype Id: `openEHR-EHR-COMPOSITION.request.v1`

Document sent from one treating healthcare provider or organisation to
another, for the purpose of requesting advice, a service or transfer of
care.

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 50%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Data item</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Allowed values</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><p><strong>category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/category</p></td>
<td style="text-align: left;"><ul>
<li><p>event<br />
<code>openehr:433</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>composer</strong><br />
Type: <code>Party</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>composer</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/composer</p></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

### context

#### `EVENT_CONTEXT: RM:context`

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 50%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Data item</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Allowed values</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><p><strong>start_time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>start_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/context/start_time</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>setting</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>setting</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/context/setting</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h5
id="_case_identification_1_1">Case identification
<strong>[1..1]</strong></h5>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.case_identification.v0</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Case identifier</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>case_identifier</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/context/other_context[at0001]/items[openEHR-EHR-CLUSTER.case_identification.v0]/items[at0001]/value</p></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

## **Medication order**

### Type: `INSTRUCTION`

### Id: `openEHR-EHR-INSTRUCTION.medication_order.v3`

An order for a medication, vaccine, nutritional product or other
therapeutic item for an identified individual.

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 50%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Data item</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Allowed values</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><p><strong>narrative</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>narrative</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/narrative</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_order_1_1">Order
<strong>[1..1]</strong></h4></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Medication item</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0070</code>]<br />
<code>medication_item</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0070]/value</p>
<p><strong>comment</strong>: Depending on the prescribing context this
field could be used for either generic- or product-based prescribing.
This data field can be used to record tightly bound orders of different
medications when they are prescribed as a single pack. It is strongly
recommended that the 'Medication item' be coded with a terminology
capable of triggering decision support, where possible. The extent of
coding may vary from the simple name of the medication item through to
structured details about the actual medication pack to be used. Free
text entry should only be used if there is no appropriate terminology
available. In KISIM, if possible filled with hospINDEX DSCRD of the
ordered product or article.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_medication_details_0_1">Medication details
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0132]/value</p>
<p><strong>comment</strong>: This item should be coded if possible. In
KISIM, if possible filled with hospINDEX DSCRD of the ordered product or
article. Usually identical to parent "Medication order/Medication
item".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ad-hoc mixture<br />
<code>local:at0143</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
<li><p>Combination product<br />
<code>local:at0001</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_stock_solution_0">Stock solution <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, filled with hospINDEX DSCRD if
the stock solution is an available medication product. If not, filled
with the user-given name of the custom stock solution. This item should
be coded if possible, directly in this element or via
CLUSTER.knowledge_base_reference in this CLUSTER.medication/Structured
details, preferrentially with hospINDEX PRDNO if it is a medication
product.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ad-hoc mixture<br />
<code>local:at0143</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
<li><p>Combination product<br />
<code>local:at0001</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_2">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_medication_component_0">Medication component
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, filled with hospINDEX DSCRD if
the medication is an available medication product, with hospINDEX CNAMED
if the medication is a component of a multi-component medication, or
with hospINDEX NAMED if the medication is a multi-ingredient substance
(e.g. Co-Amoxicillin). This item should be coded if possible, directly
in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
PRDNO if it is a medication product or hospINDEX SUBNO if it is a
medication substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order. A "medication component" can only be an
"Ingredient" if its substances should be grouped (such as
amoxicillin/clavulanic acid) but do not exist as their own
(multi-ingredient) medication product.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_3">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_0">Substance <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_4">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p></td>
<td style="text-align: left;"><ul>
<li><p>Therapeutic<br />
<code>local:at0080</code></p></li>
<li><p>Adjuvant<br />
<code>local:at0083</code></p></li>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_2">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_2">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_solvent_0">Solvent
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, filled with hospINDEX DSCRD if
the solvent is an available medication product. If not, filled with the
user-given name of the custom solvent. This item should be coded if
possible, directly in this element or via
CLUSTER.knowledge_base_reference in this CLUSTER.medication/Structured
details, preferrentially with hospINDEX PRDNO if it is a medication
product.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ad-hoc mixture<br />
<code>local:at0143</code></p></li>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_5">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_0_2">Substance <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_6">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p>
<p><strong>comment</strong>: As a substance of a solvent, its role
should always be "excipient".</p></td>
<td style="text-align: left;"><ul>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_3">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_3">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[at0127]/value</p>
<p><strong>comment</strong>: A solvent should always have the role
"excipient".</p></td>
<td style="text-align: left;"><ul>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_4">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_solvent_selection_0_1">Solvent selection
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Medium use</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>medium_use</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Solvent
selection']/items[at0001]/value</p>
<p><strong>comment</strong>: Use 'Required' when the medium is
definitely part of the ordered mixture. Use 'Alternative' when the
medium is one possible option within an option group.</p></td>
<td style="text-align: left;"><ul>
<li><p>Required<br />
<code>local:at0002</code></p></li>
<li><p>Alternative<br />
<code>local:at0003</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Option
identifier</strong><br />
Type: <code>Identifier</code> (<em>1..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>option_identifier</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Solvent
selection']/items[at0005]/value</p>
<p><strong>comment</strong>: Use the same option identifier for multiple
media that must be used together as one option, for example [NaCl 50 ml
+ glucose 50 ml]. Use different option identifiers for mutually
exclusive alternatives.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Selection rule</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>selection_rule</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Solvent
selection']/items[at0006]/value</p>
<p><strong>comment</strong>: The value should be identical for all
members of the same option group. Usually omitted when the inclusion
type is 'Required'.</p></td>
<td style="text-align: left;"><ul>
<li><p>Exactly one option<br />
<code>local:at0007</code></p></li>
<li><p>One or more options<br />
<code>local:at0008</code></p></li>
<li><p><em>Other text/ coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_4">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Solvent']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_0_3">Substance <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_7">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p></td>
<td style="text-align: left;"><ul>
<li><p>Therapeutic<br />
<code>local:at0080</code></p></li>
<li><p>Adjuvant<br />
<code>local:at0083</code></p></li>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_5">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_5">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_6">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Stock
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_carrier_solution_0">Carrier solution <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, filled with hospINDEX DSCRD if
the carrier solution is an available medication product. If not, filled
with the user-given name of the custom carrier solution. This item
should be coded if possible, directly in this element or via
CLUSTER.knowledge_base_reference in this CLUSTER.medication/Structured
details, preferrentially with hospINDEX PRDNO if it is a medication
product.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ad-hoc mixture<br />
<code>local:at0143</code></p></li>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_8">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_0_4">Substance <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_9">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p></td>
<td style="text-align: left;"><ul>
<li><p>Therapeutic<br />
<code>local:at0080</code></p></li>
<li><p>Adjuvant<br />
<code>local:at0083</code></p></li>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_7">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_6">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[at0127]/value</p>
<p><strong>comment</strong>: A carrier solution should always have the
role "excipient".</p></td>
<td style="text-align: left;"><ul>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_8">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_carrier_solution_selection_0_1">Carrier solution selection
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Medium use</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>medium_use</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Carrier
solution selection']/items[at0001]/value</p>
<p><strong>comment</strong>: Use 'Required' when the medium is
definitely part of the ordered mixture. Use 'Alternative' when the
medium is one possible option within an option group.</p></td>
<td style="text-align: left;"><ul>
<li><p>Required<br />
<code>local:at0002</code></p></li>
<li><p>Alternative<br />
<code>local:at0003</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Option
identifier</strong><br />
Type: <code>Identifier</code> (<em>1..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>option_identifier</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Carrier
solution selection']/items[at0005]/value</p>
<p><strong>comment</strong>: Use the same option identifier for multiple
media that must be used together as one option, for example [NaCl 50 ml
+ glucose 50 ml]. Use different option identifiers for mutually
exclusive alternatives.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Selection rule</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>selection_rule</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1,'Carrier
solution selection']/items[at0006]/value</p>
<p><strong>comment</strong>: The value should be identical for all
members of the same option group. Usually omitted when the inclusion
type is 'Required'.</p></td>
<td style="text-align: left;"><ul>
<li><p>Exactly one option<br />
<code>local:at0007</code></p></li>
<li><p>One or more options<br />
<code>local:at0008</code></p></li>
<li><p><em>Other text/ coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_7">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Carrier
solution']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_medication_component_0_2">Medication component
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, filled with hospINDEX CNAMED if
the medication is a component of a multi-component medication product,
or with hospINDEX NAMED if the medication is a multi-ingredient
substance. This item should be coded if possible, directly in this
element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
PRDNO if it is a medication product or hospINDEX SUBNO if it is a
medication substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order. A "medication component" can only be an
"Ingredient" if its substances should be grouped (such as
amoxicillin/clavulanic acid) but do not exist as their own
(multi-ingredient) medication product.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
<li><p>Multi-ingredient product<br />
<code>local:at0144</code></p></li>
<li><p>Single-ingredient product<br />
<code>local:at0145</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_10">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_1">Substance <strong>[1..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_11">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p></td>
<td style="text-align: left;"><ul>
<li><p>Therapeutic<br />
<code>local:at0080</code></p></li>
<li><p>Adjuvant<br />
<code>local:at0083</code></p></li>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_9">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_8">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_10">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dose_lead_0_1_9">Dose
lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Medication
component']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_substance_0_5">Substance <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.medication.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0132</code>]<br />
<code>name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0132]/value</p>
<p><strong>comment</strong>: In KISIM, if possible filled with hospINDEX
NAMD of the respective substance. This item should be coded if possible,
directly in this element or via CLUSTER.knowledge_base_reference in this
CLUSTER.medication/Structured details, preferrentially with hospINDEX
SUBNO.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Category</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0142</code>]<br />
<code>category</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0142]/value</p>
<p><strong>comment</strong>: For example: 'Paracetamol/codeine' is a
Multi-ingredient product, while 'Morphine 60 mg + Haloperidol 2 mg +
Midazolam 5 mg' is an Ad-hoc mixture, whose composition is fully
specified within the order.</p></td>
<td style="text-align: left;"><ul>
<li><p>Ingredient<br />
<code>local:at0146</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_strength_presentation_0_1_12">Strength (presentation)
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0152</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
numerator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0153</code>]<br />
<code>strength_numerator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0153]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength numerator is '300 µg'. For a presentation
strength of '100 mg/tablet', the strength numerator value is '100
mg'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
denominator</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0157</code>]<br />
<code>strength_denominator</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0152]/items[at0157]/value</p>
<p><strong>comment</strong>: For example: For a presentation strength of
'300 µg/0.3 ml', the strength denominator value is '0.3 ml'. For a
presentation strength of '100 mg/tablet', the strength denominator value
is '1 tablet'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Strength
(concentration)</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0115</code>]<br />
<code>strength_concentration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0115]/value</p>
<p><strong>comment</strong>: This element is used for liquid or
semisolid medications, or medications intended to be diluted in a liquid
before administration. For example: '10 mg/ml', '20 mg/g', '5 %',
'10,000 SQ-U/ml'. If the 'Strength (presentation)' cluster is used, this
element becomes redundant.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Role</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0127</code>]<br />
<code>role</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[at0127]/value</p></td>
<td style="text-align: left;"><ul>
<li><p>Therapeutic<br />
<code>local:at0080</code></p></li>
<li><p>Adjuvant<br />
<code>local:at0083</code></p></li>
<li><p>Excipient<br />
<code>local:at0084</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_11">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_dose_lead_0_1_10">Dose lead <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dose_lead_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is dose lead</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>is_dose_lead</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.medication.v2,'Substance']/items[openEHR-EHR-CLUSTER.dose_lead_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: Set to "True" only for the substance,
ingredient group or combination product selected as the dose calculation
basis. Set to False or omit otherwise.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Amount</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0139</code>]<br />
<code>amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0139]/value</p>
<p><strong>comment</strong>: For example: '1 ml', '1.5 mg', '1000
ml'.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Description</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0133</code>]<br />
<code>description</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[at0133]/value</p>
<p><strong>comment</strong>: In KISIM only used for freetext
medications.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_knowledge_base_reference_0_12">Knowledge base reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.knowledge_base_reference.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>knowledge_base_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0001]/value</p>
<p><strong>comment</strong>: For example: hospindex,
Stammdaten.</p></td>
<td style="text-align: left;"><ul>
<li><p>hospindex</p></li>
<li><p><em>Other text/coded text allowed</em></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Knowledge base
version</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0006</code>]<br />
<code>knowledge_base_version</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0006]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Code name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0005</code>]<br />
<code>code_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0005,'Code
name']/value</p>
<p><strong>comment</strong>: For example: "PRDNO" for hospINDEX
Products, "SUBNO" for hospINDEX Substances, "Pharmacode" for hospINDEX
Articles.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Item URI</strong><br />
Type: <code>ExternalURI</code> (<em>1..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>item_uri</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.medication.v2]/items[openEHR-EHR-CLUSTER.knowledge_base_reference.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: Example: hospindex/2033-05/777630</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Route</strong><br />
Type: <code>CodedText</code> (<em>1..1</em>)<br />
NodeID: [<code>at0091</code>]<br />
<code>route</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0091]/value</p>
<p><strong>comment</strong>: For example: 'oral', 'intravenous', or
'topical'. Coding of the route with a terminology is preferred, where
possible. Multiple potential routes may be specified.</p></td>
<td style="text-align: left;"><ul>
<li><p>Anwendung am Ohr<br />
<code>EDQM:20001000</code></p></li>
<li><p>Buccale Anwendung<br />
<code>EDQM:20002500</code></p></li>
<li><p>Anwendung auf der Haut<br />
<code>EDQM:20003000</code></p></li>
<li><p>dentale Anwendung<br />
<code>EDQM:20004000</code></p></li>
<li><p>endozervikale Anwendung<br />
<code>EDQM:20006000</code></p></li>
<li><p>Anwendung in den Nebenhöhlen<br />
<code>EDQM:20007000</code></p></li>
<li><p>endotracheopulmonale Anwendung<br />
<code>EDQM:20008000</code></p></li>
<li><p>epidurale Anwendung<br />
<code>EDQM:20009000</code></p></li>
<li><p>zum Auftragen auf die Wunde<br />
<code>EDQM:20010000</code></p></li>
<li><p>extraamniotische Anwendung<br />
<code>EDQM:20011000</code></p></li>
<li><p>extrakorporale Anwendung<br />
<code>EDQM:20011500</code></p></li>
<li><p>extrapleurale Anwendung<br />
<code>EDQM:20087000</code></p></li>
<li><p>gastrointestinale Anwendung<br />
<code>EDQM:20013000</code></p></li>
<li><p>zur Anwendung mittels Magensonde<br />
<code>EDQM:20013500</code></p></li>
<li><p>Anwendung am Zahnfleisch<br />
<code>EDQM:20014000</code></p></li>
<li><p>Hämodialyse<br />
<code>EDQM:20015000</code></p></li>
<li><p>zur Implantation<br />
<code>EDQM:20015500</code></p></li>
<li><p>Infiltration<br />
<code>EDQM:20019500</code></p></li>
<li><p>zur Inhalation<br />
<code>EDQM:20020000</code></p></li>
<li><p>intestinale Anwendung<br />
<code>EDQM:20021000</code></p></li>
<li><p>intraamniotische Anwendung<br />
<code>EDQM:20022000</code></p></li>
<li><p>intraarterielle Anwendung<br />
<code>EDQM:20023000</code></p></li>
<li><p>intraartikuläre Anwendung<br />
<code>EDQM:20024000</code></p></li>
<li><p>intrabursale Anwendung<br />
<code>EDQM:20025000</code></p></li>
<li><p>intrakamerale Anwendung<br />
<code>EDQM:20025500</code></p></li>
<li><p>intracardiale Anwendung<br />
<code>EDQM:20026000</code></p></li>
<li><p>intrakartilaginäre Anwendung<br />
<code>EDQM:20026500</code></p></li>
<li><p>intrakavernöse Anwendung<br />
<code>EDQM:20027000</code></p></li>
<li><p>Intrazerebrale Anwendung<br />
<code>EDQM:20027010</code></p></li>
<li><p>intrazervikale Anwendung<br />
<code>EDQM:20028000</code></p></li>
<li><p>zur Anwendung in der Cholangiopankreatikographie<br />
<code>EDQM:20028300</code></p></li>
<li><p>intracisternale Anwendung<br />
<code>EDQM:20028500</code></p></li>
<li><p>intrakoronare Anwendung<br />
<code>EDQM:20029000</code></p></li>
<li><p>intradermale Anwendung<br />
<code>EDQM:20030000</code></p></li>
<li><p>intradiskale Anwendung<br />
<code>EDQM:20031000</code></p></li>
<li><p>intraepidermale Anwendung<br />
<code>EDQM:20031500</code></p></li>
<li><p>intraglanduläre Anwendung<br />
<code>EDQM:20031700</code></p></li>
<li><p>intraläsionale Anwendung<br />
<code>EDQM:20032000</code></p></li>
<li><p>intralymphatische Anwendung<br />
<code>EDQM:20033000</code></p></li>
<li><p>intramuskuläre Anwendung<br />
<code>EDQM:20035000</code></p></li>
<li><p>intraokulare Anwendung<br />
<code>EDQM:20036000</code></p></li>
<li><p>intraossäre Anwendung<br />
<code>EDQM:20036500</code></p></li>
<li><p>Intraperikardial<br />
<code>EDQM:20037000</code></p></li>
<li><p>intraperitoneale Anwendung<br />
<code>EDQM:20038000</code></p></li>
<li><p>intrapleurale Anwendung<br />
<code>EDQM:20039000</code></p></li>
<li><p>intraportale Anwendung<br />
<code>EDQM:20039200</code></p></li>
<li><p>intraprostatische Anwendung<br />
<code>EDQM:20039500</code></p></li>
<li><p>intrasternale Anwendung<br />
<code>EDQM:20041000</code></p></li>
<li><p>intrathekale Anwendung<br />
<code>EDQM:20042000</code></p></li>
<li><p>intratumorale Anwendung<br />
<code>EDQM:20043000</code></p></li>
<li><p>intrauterine Anwendung<br />
<code>EDQM:20044000</code></p></li>
<li><p>intravenöse Anwendung<br />
<code>EDQM:20045000</code></p></li>
<li><p>intravesikale Anwendung<br />
<code>EDQM:20046000</code></p></li>
<li><p>Intravitreal<br />
<code>EDQM:20047000</code></p></li>
<li><p>zur Iontophorese<br />
<code>EDQM:20047500</code></p></li>
<li><p>zur Anwendung im Rachen und am Kehlkopf<br />
<code>EDQM:20048000</code></p></li>
<li><p>nasale Anwendung<br />
<code>EDQM:20049000</code></p></li>
<li><p>Anwendung am Auge<br />
<code>EDQM:20051000</code></p></li>
<li><p>zum Einnehmen<br />
<code>EDQM:20053000</code></p></li>
<li><p>Anwendung in der Mundhöhle<br />
<code>EDQM:20054000</code></p></li>
<li><p>zur Anwendung im Mund- und Rachenraum<br />
<code>EDQM:20055000</code></p></li>
<li><p>periartikuläre Anwendung<br />
<code>EDQM:20057000</code></p></li>
<li><p>perineurale Anwendung<br />
<code>EDQM:20058000</code></p></li>
<li><p>zur periodontalen Anwendung<br />
<code>EDQM:20059000</code></p></li>
<li><p>periossäre Anwendung<br />
<code>EDQM:20059300</code></p></li>
<li><p>peritumorale Anwendung<br />
<code>EDQM:20059400</code></p></li>
<li><p>posteriore juxtasclerale Anwendung<br />
<code>EDQM:20059500</code></p></li>
<li><p>rektale Anwendung<br />
<code>EDQM:20061000</code></p></li>
<li><p>retrobulbäre Anwendung<br />
<code>EDQM:20061500</code></p></li>
<li><p>Art der Anwendung nicht spezifizierbar<br />
<code>EDQM:20062000</code></p></li>
<li><p>Einritzen der Haut<br />
<code>EDQM:20063000</code></p></li>
<li><p>subkonjunktivale Anwendung<br />
<code>EDQM:20065000</code></p></li>
<li><p>subkutane Anwendung<br />
<code>EDQM:20066000</code></p></li>
<li><p>Sublingual<br />
<code>EDQM:20067000</code></p></li>
<li><p>submuköse Anwendung<br />
<code>EDQM:20067500</code></p></li>
<li><p>transdermale Anwendung<br />
<code>EDQM:20070000</code></p></li>
<li><p>Anwendung in der Harnröhre<br />
<code>EDQM:20071000</code></p></li>
<li><p>vaginale Anwendung<br />
<code>EDQM:20072000</code></p></li>
<li><p>intracerebroventrikuläre Anwendung<br />
<code>EDQM:20080000</code></p></li>
<li><p>subretinale Anwendung<br />
<code>EDQM:20081000</code></p></li>
<li><p>intracorneale Anwendung<br />
<code>EDQM:20084000</code></p></li>
<li><p>Intraputaminale Anwendung<br />
<code>EDQM:20086000</code></p></li>
<li><p>periläsionale Anwendung<br />
<code>EDQM:20088000</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Body site</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0092</code>]<br />
<code>body_site</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0092]/value</p>
<p><strong>comment</strong>: For example: 'left upper arm', 'intravenous
catheter right hand'. Coding of the body site with a terminology is
preferred, where possible.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
method</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0094</code>]<br />
<code>administration_method</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0094]/value</p>
<p><strong>comment</strong>: For example: ' via Z-track injection'; 'via
nebuliser'. Coding of the method with a terminology is preferred, where
possible.</p></td>
<td style="text-align: left;"><ul>
<li><p>Administration<br />
<code>EDQM:0004</code></p></li>
<li><p>Applikation<br />
<code>EDQM:0005</code></p></li>
<li><p>Baden<br />
<code>EDQM:0006</code></p></li>
<li><p>Kauen<br />
<code>EDQM:0007</code></p></li>
<li><p>Gurgeln<br />
<code>EDQM:0008</code></p></li>
<li><p>Infusion<br />
<code>EDQM:0009</code></p></li>
<li><p>Inhalation<br />
<code>EDQM:0010</code></p></li>
<li><p>Injektion<br />
<code>EDQM:0011</code></p></li>
<li><p>Insertion<br />
<code>EDQM:0012</code></p></li>
<li><p>Instillation<br />
<code>EDQM:0013</code></p></li>
<li><p>Orodispersion<br />
<code>EDQM:0014</code></p></li>
<li><p>Spülen/Waschen<br />
<code>EDQM:0015</code></p></li>
<li><p>Sprühen<br />
<code>EDQM:0017</code></p></li>
<li><p>Lutschen<br />
<code>EDQM:0018</code></p></li>
<li><p>Schlucken<br />
<code>EDQM:0019</code></p></li>
<li><p>Keine Angaben<br />
<code>EDQM:0020</code></p></li>
<li><p>Brennen<br />
<code>EDQM:0111</code></p></li>
<li><p>Dialyse<br />
<code>EDQM:0112</code></p></li>
<li><p>Implantation<br />
<code>EDQM:0113</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_installation_0">Installation <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.device.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Device name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>device_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.device.v1,'Installation']/items[at0001]/value</p>
<p><strong>comment</strong>: This data element will capture the term,
phrase or category used in clinical practice. For example: &lt;brand
name&gt;&lt;machine&gt; (XYZ Audiometer); &lt;size&gt; &lt;brand
name&gt; &lt;intravenous catheter&gt; (14G Jelco IV catheter); or
&lt;brand name/type&gt; &lt;implant&gt;. Coding with a terminology is
desirable, where possible, although this may be local and depending on
local supplies available.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_lumen_0">Lumen
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.device.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Lumen name</strong><br />
Type: <code>Text</code> (<em>1..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>lumen_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.device.v1,'Installation']/items[openEHR-EHR-CLUSTER.device.v1,'Lumen']/items[at0001,'Lumen
name']/value</p>
<p><strong>comment</strong>: This data element will capture the term,
phrase or category used in clinical practice. For example: &lt;brand
name&gt;&lt;machine&gt; (XYZ Audiometer); &lt;size&gt; &lt;brand
name&gt; &lt;intravenous catheter&gt; (14G Jelco IV catheter); or
&lt;brand name/type&gt; &lt;implant&gt;. Coding with a terminology is
desirable, where possible, although this may be local and depending on
local supplies available.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Type</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>type</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.device.v1,'Installation']/items[openEHR-EHR-CLUSTER.device.v1,'Lumen']/items[at0003]/value</p>
<p><strong>comment</strong>: Not applicable if a category is already
recorded in 'Device name'. Example: if the 'Device' is named as a
'urinary catheter'; the 'Type' may be recorded as 'indwelling' or
'condom'.Coding with a terminology is desirable, where possible. This
may include use of GTIN or EAN numbers.</p></td>
<td style="text-align: left;"><ul>
<li><p>Single lumen tube<br />
<code>SNOMED-CT:257369004</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Description</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>description</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.device.v1,'Installation']/items[openEHR-EHR-CLUSTER.device.v1,'Lumen']/items[at0002]/value</p>
<p><strong>comment</strong>: Can contain more detailed description of
the lumen, e.g. color, if this is not already stored in "Lumen
name".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_once_0">Once
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dosage_1_1">Dosage
<strong>[1..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_once_0_1">Timing once <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Point in time for
application</strong><br />
Type: <code>Time</code> (<em>0..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>point_in_time_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
once']/items[at0004,'Point in time for application']/value</p>
<p><strong>comment</strong>: For example: "08:00" or
"15:00-16:00".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
once']/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[at0178,'Therapeutic
Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Once']/items[at0179,'Therapeutic
Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_periodically_0">Periodically <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dosage_1_1_2">Dosage
<strong>[1..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_daily_0_1">Timing - daily <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Repetition interval for hours
and minutes</strong><br />
Type: <code>Duration</code> (<em>0..1</em>)<br />
NodeID: [<code>at0014</code>]<br />
<code>repetition_interval_for_hours_and_minutes</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0014,'Repetition
interval for hours and minutes']/value</p>
<p><strong>comment</strong>: For example: "Every 4 hours" or "Every 4 to
6 hours".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Specific time for first
application</strong><br />
Type: <code>Time</code> (<em>0..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>specific_time_for_first_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0004,'Specific
time for first application']/value</p>
<p><strong>comment</strong>: For example: "08:00" or "15:00". The date
of first application is stored in
openEHR-EHR-CLUSTER.timing_nondaily.v1/Specific date for first
application[at0001]</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[at0178,'Therapeutic
Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[at0179,'Therapeutic
Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_non_daily_0_1">Timing - non-daily
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_nondaily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Repetition interval for
days</strong><br />
Type: <code>Duration</code> (<em>0..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>repetition_interval_for_days</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.timing_nondaily.v1]/items[at0002,'Repetition
interval for days']/value</p>
<p><strong>comment</strong>: For example: 'Every 3 weeks'. If necessary,
this element can be used to explicity specify that an activity is to
take place every single day, by setting it to "1 day".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Specific date for first
application</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0001</code>]<br />
<code>specific_date_for_first_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Periodically']/items[openEHR-EHR-CLUSTER.timing_nondaily.v1]/items[at0001,'Specific
date for first application']</p>
<p><strong>comment</strong>: For example: 'on 12 Jan 2017'. The time of
first application is stored in
openEHR-EHR-CLUSTER.timing_daily.v1/Specific time for first
application[at0004]</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Date</code><br />
NodeID: [<code>at0001</code>]<br />
<code>date_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Date</code><br />
NodeID: [<code>at0001</code>]<br />
<code>interval_of_date_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DATE&gt;</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_schema_0">Schema
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_morning_0_1">Morning
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Morning']/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Morning']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_morning_0_1">Timing morning <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Time period for
application</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>time_period_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Morning']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
morning']/items[at0004,'Time period for application']</p>
<p><strong>comment</strong>: For example: "08:00" or "15:00-16:00".
Although a specific point in time can be recorded, a time interval is
more appropriate for a "Schema" medication order.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>time_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>interval_of_time_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_TIME&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Morning']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
morning']/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Morning']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_noon_0_1">Noon
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Noon']/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Noon']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_noon_0_1">Timing noon <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Time period for
application</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>time_period_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Noon']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
noon']/items[at0004,'Time period for application']</p>
<p><strong>comment</strong>: For example: "08:00" or "15:00-16:00".
Although a specific point in time can be recorded, a time interval is
more appropriate for a "Schema" medication order.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>time_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>interval_of_time_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_TIME&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Noon']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
noon']/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Noon']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_evening_0_1">Evening
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Evening']/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Evening']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_evening_0_1">Timing evening <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Time period for
application</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>time_period_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Evening']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
evening']/items[at0004,'Time period for application']</p>
<p><strong>comment</strong>: For example: "08:00" or "15:00-16:00".
Although a specific point in time can be recorded, a time interval is
more appropriate for a "Schema" medication order.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>time_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>interval_of_time_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_TIME&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Evening']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
evening']/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Evening']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_night_0_1">Night
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>0..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Night']/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Night']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_night_0_1">Timing night <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Time period for
application</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>time_period_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Night']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
night']/items[at0004,'Time period for application']</p>
<p><strong>comment</strong>: For example: "08:00" or "15:00-16:00".
Although a specific point in time can be recorded, a time interval is
more appropriate for a "Schema" medication order.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>time_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>interval_of_time_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_TIME&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Night']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing
night']/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[openEHR-EHR-CLUSTER.dosage.v2,'Night']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[at0178,'Therapeutic
Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Schema']/items[at0179,'Therapeutic
Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_day_plan_0">Day plan
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_time_event_1">Time
event <strong>[1..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[openEHR-EHR-CLUSTER.dosage.v2,'Time
event']/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[openEHR-EHR-CLUSTER.dosage.v2,'Time
event']/items[at0178,'Reference substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_daily_1">Timing - daily <strong>[1..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Point in time for
application</strong><br />
Type: <code>Time</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>point_in_time_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[openEHR-EHR-CLUSTER.dosage.v2,'Time
event']/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0004,'Point
in time for application']/value</p>
<p><strong>comment</strong>: For example: "08:00".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[openEHR-EHR-CLUSTER.dosage.v2,'Time
event']/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[openEHR-EHR-CLUSTER.dosage.v2,'Time
event']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[at0178,'Therapeutic Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Day
plan']/items[at0179,'Therapeutic Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_week_plan_0">Week
plan <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dosage_1">Dosage
<strong>[1..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0144]/value</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_daily_1_2">Timing - daily <strong>[1..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Point in time for
application</strong><br />
Type: <code>Time</code> (<em>1..*</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>point_in_time_for_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0004,'Point
in time for application']/value</p>
<p><strong>comment</strong>: For example: "08:00".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>As required</strong><br />
Type: <code>Boolean</code> (<em>0..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>as_required</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0024]/value</p>
<p><strong>comment</strong>: If this is set to True, the patient should
be actively offered the medication before administration at the time
specified in the "Therapeutic Direction", who can choose whether he
needs it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[at0178,'Therapeutic Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[at0179,'Therapeutic Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_non_daily_1_1">Timing - non-daily
<strong>[1..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_nondaily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Specific day of
week</strong><br />
Type: <code>CodedText</code> (<em>1..7</em>)<br />
NodeID: [<code>at0003</code>]<br />
<code>specific_day_of_week</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Week
plan']/items[openEHR-EHR-CLUSTER.timing_nondaily.v1]/items[at0003]/value</p>
<p><strong>comment</strong>: For example: 'On Monday, Wednesday and
Friday'.</p></td>
<td style="text-align: left;"><ul>
<li><p>Monday<br />
<code>local:at0007</code></p></li>
<li><p>Tuesday<br />
<code>local:at0008</code></p></li>
<li><p>Wednesday<br />
<code>local:at0016</code></p></li>
<li><p>Thursday<br />
<code>local:at0017</code></p></li>
<li><p>Friday<br />
<code>local:at0018</code></p></li>
<li><p>Saturday<br />
<code>local:at0019</code></p></li>
<li><p>Sunday<br />
<code>local:at0020</code></p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_conditional_0">Conditional <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Priority</strong><br />
Type: <code>Count</code> (<em>0..1</em>)<br />
NodeID: [<code>at0057</code>]<br />
<code>priority</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[at0057,'Priority']/value</p>
<p><strong>comment</strong>: For example: ''1' '2', '3'.</p></td>
<td style="text-align: left;"><p>Range:<br />
</p>
<ul>
<li><p>&gt;= 1 and undefined undefined</p></li>
</ul></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_dosage_1_1_3">Dosage
<strong>[1..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0144]</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Quantity</code><br />
NodeID: [<code>at0144</code>]<br />
<code>quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>Anw</p></li>
<li><p>Blist</p></li>
<li><p>Btl</p></li>
<li><p>Dos</p></li>
<li><p>Dosierpip</p></li>
<li><p>Dosierspr</p></li>
<li><p>EL</p></li>
<li><p>Fl</p></li>
<li><p>Tropf</p></li>
<li><p>Hub</p></li>
<li><p>MB</p></li>
<li><p>ML</p></li>
<li><p>Pck</p></li>
<li><p>Pfl</p></li>
<li><p>Stk</p></li>
<li><p>Tube</p></li>
<li><p>Teilpck</p></li>
<li><p>TL</p></li>
<li><p>N/A</p></li>
<li><p>E</p></li>
<li><p>Mio E</p></li>
<li><p>IE</p></li>
<li><p>Mio IE</p></li>
<li><p>ng</p></li>
<li><p>mcg</p></li>
<li><p>mg</p></li>
<li><p>g</p></li>
<li><p>ml</p></li>
<li><p>nmol</p></li>
<li><p>mcmol</p></li>
<li><p>mmol</p></li>
<li><p>ppm</p></li>
<li><p>J</p></li>
<li><p>kJ</p></li>
<li><p>cal</p></li>
<li><p>kcal</p></li>
<li><p>Bq</p></li>
<li><p>kBq</p></li>
<li><p>MBq</p></li>
<li><p>GBq</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Quantity</code><br />
NodeID: [<code>at0144</code>]<br />
<code>interval_of_quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_timing_0_1">Timing
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Minimum interval</strong><br />
Type: <code>Duration</code> (<em>0..1</em>)<br />
NodeID: [<code>at0014</code>]<br />
<code>minimum_interval</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing']/items[at0014,'Minimum
interval']/value</p>
<p><strong>comment</strong>: For example: "At most every 4 hours" or "At
most every 10 minutes".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Is conditional</strong><br />
Type: <code>Boolean</code> (<em>1..1</em>)<br />
NodeID: [<code>at0024</code>]<br />
<code>is_conditional</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing']/items[at0024,'Is
conditional']/value</p>
<p><strong>comment</strong>: "Conditional administration" refers to a
medication that is only administered if a certain criterion is met
(pain, body temperature, blood pressure…). It is often also associated
with additional limiters such as a minimum time between administrations,
or a maximum number of administrations per day. This differs from "as
required"/"bei Bedarf", which has a standard "therapeutic direction",
but the patient is actively offered the medication and who can decide to
take it or not.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Conditional
criterion</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0025</code>]<br />
<code>conditional_criterion</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing']/items[at0025,'Conditional
criterion']/value</p>
<p><strong>comment</strong>: For example: "for pain".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.dosage.v2]/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[at0178,'Therapeutic
Direction start date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[at0179,'Therapeutic
Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_conditional_medication_instructions_or_0">Conditional medication
instructions - OR <strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_condition_rule_and_0">Condition rule - AND
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: at0005</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Condition name</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0008</code>]<br />
<code>condition_name</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1,'Conditional
medication instructions - OR']/items[at0005,'Condition rule -
AND']/items[at0008]/value</p>
<p><strong>comment</strong>: For example: serum blood glucose; systolic
blood pressure; INR. If possible, coding with a terminology such as
SNOMED-CT or LOINC is recommended, especially with measurable conditions
such as vital parameters, to make the condition computable.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Condition</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>condition</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Conditional']/items[openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1,'Conditional
medication instructions - OR']/items[at0005,'Condition rule -
AND']/items[at0002]</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Quantity</code><br />
NodeID: [<code>at0002</code>]<br />
<code>quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Quantity</code><br />
NodeID: [<code>at0002</code>]<br />
<code>interval_of_quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Count</code><br />
NodeID: [<code>at0002</code>]<br />
<code>count_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Count</code><br />
NodeID: [<code>at0002</code>]<br />
<code>interval_of_count_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Proportion</code><br />
NodeID: [<code>at0002</code>]<br />
<code>proportion_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Text</code><br />
NodeID: [<code>at0002</code>]<br />
<code>text_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Boolean</code><br />
NodeID: [<code>at0002</code>]<br />
<code>boolean_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_rate_therapy_0_1">Rate therapy <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.therapeutic_direction.v1</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_rate_1_1">Rate
<strong>[1..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose formula</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0135</code>]<br />
<code>dose_formula</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Rate']/items[at0135]</p>
<p><strong>comment</strong>: For example: '10 mg/kg/day'. The result of
this formula would normally be held in Dose or Administration
rate/duration. Where clinical measurements such as body weight is used
in the dose calculation, a LINK attribute should used to specify which
particular measurement has been used.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Text</code><br />
NodeID: [<code>at0135</code>]<br />
<code>text_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Quantity</code><br />
NodeID: [<code>at0135</code>]<br />
<code>quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Rate']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_timing_daily_0_1_2">Timing - daily <strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Specific time for first
application</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>specific_time_for_first_application</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Rate']/items[openEHR-EHR-CLUSTER.timing_daily.v1]/items[at0004,'Specific
time for first application']</p>
<p><strong>comment</strong>: For example: "08:00" or
"15:00-16:00".</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>time_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Time</code><br />
NodeID: [<code>at0004</code>]<br />
<code>interval_of_time_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_TIME&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
rate</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0134</code>]<br />
<code>administration_rate</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Rate']/items[at0134]</p>
<p><strong>comment</strong>: For example: '200 ml/h'. Use the text data
type to record non- or semi-quantifiable instructions.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Quantity</code><br />
NodeID: [<code>at0134</code>]<br />
<code>quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"><p>Valid units:<br />
</p>
<ul>
<li><p>l/d</p></li>
<li><p>l/h</p></li>
<li><p>ml/h</p></li>
<li><p>ml/min</p></li>
<li><p>ml/s</p></li>
<li><p>ml/d</p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Text</code><br />
NodeID: [<code>at0134</code>]<br />
<code>text_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_bolus_0_1">Bolus
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.dosage.v2</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Dose</strong><br />
Type: <code>Choice</code> (<em>1..1</em>)<br />
NodeID: [<code>at0144</code>]<br />
<code>dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Bolus']/items[at0144]</p>
<p><strong>comment</strong>: For example: 1 mg, 1.5 ml, 0.125 g; or 1-2
ml, 12.5-20.5 mg.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Quantity</code><br />
NodeID: [<code>at0144</code>]<br />
<code>quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Quantity</code><br />
NodeID: [<code>at0144</code>]<br />
<code>interval_of_quantity_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference
substance</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>reference_substance</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Bolus']/items[at0178,'Reference
substance']/value</p>
<p><strong>comment</strong>: Use a coded substance concept where
possible (e.g., from HCI hospINDEX or SNOMED CT). This element should
contain only the identity of the substance, not the amount or unit.
Populate when the dose is expressed in terms of a substance (e.g., “500
mg Paracetamol”). Leave empty when the dose is expressed solely in
proprietary product units (e.g., “1 tablet”) without reference to a
specific substance.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4 id="_timing_0_1_2">Timing
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.timing_daily.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Minimum interval</strong><br />
Type: <code>Duration</code> (<em>0..1</em>)<br />
NodeID: [<code>at0014</code>]<br />
<code>minimum_interval</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Bolus']/items[openEHR-EHR-CLUSTER.timing_daily.v1,'Timing']/items[at0014,'Minimum
interval']/value</p>
<p><strong>comment</strong>: For example: "At most every 4 hours" or "At
most every 10 minutes".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Administration
duration</strong><br />
Type: <code>Choice</code> (<em>0..1</em>)<br />
NodeID: [<code>at0102</code>]<br />
<code>administration_duration</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[openEHR-EHR-CLUSTER.dosage.v2,'Bolus']/items[at0102]</p>
<p><strong>comment</strong>: For example: 'Administer over 10
minutes'.</p></td>
<td style="text-align: left;"><p><em>Multiple data types
allowed</em></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><em>SubTypes</em></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type: <code>Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>duration_value</code></p></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p>Type:
<code>Interval of Duration</code><br />
NodeID: [<code>at0102</code>]<br />
<code>interval_of_duration_value</code></p></td>
<td style="text-align: left;"></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: DV_INTERVAL&lt;DV_DURATION&gt;</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0178</code>]<br />
<code>therapeutic_direction_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[at0178,'Therapeutic Direction start
date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0012::"Order start date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Therapeutic Direction stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0179</code>]<br />
<code>therapeutic_direction_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[openEHR-EHR-CLUSTER.therapeutic_direction.v1,'Rate
therapy']/items[at0179,'Therapeutic Direction stop date/time']/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0013::"Order stop date/time" in
INSTRUCTION.medication_order.v3.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_medication_safety_0_1">Medication safety
<strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0062</code></p></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_maximum_dose_0">Maximum dose <strong>[0..*]</strong></h4>
<p><code>CLUSTER: at0051</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Maximum amount</strong><br />
Type: <code>Quantity</code> (<em>1..1</em>)<br />
NodeID: [<code>at0130</code>]<br />
<code>maximum_amount</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0062]/items[at0051]/items[at0130]/value</p>
<p><strong>comment</strong>: For example: 1 ml, 1.5 mg, 0.125
g.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Allowed period</strong><br />
Type: <code>Duration</code> (<em>1..1</em>)<br />
NodeID: [<code>at0053</code>]<br />
<code>allowed_period</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0062]/items[at0051]/items[at0053]/value</p>
<p><strong>comment</strong>: Example: 24 hours.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Clinical
indication</strong><br />
Type: <code>Text</code> (<em>0..*</em>)<br />
NodeID: [<code>at0018</code>]<br />
<code>clinical_indication</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0018]/value</p>
<p><strong>comment</strong>: For example: 'Angina'. Coding of the
clinical indication with a terminology is preferred, where possible.
This data element allows multiple occurrences. It is not intended to
carry an indication for administrative authorisation purposes.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_order_details_0_1">Order details <strong>[0..1]</strong></h4>
<p><code>CLUSTER: at0113</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order start
date/time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>at0012</code>]<br />
<code>order_start_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0113]/items[at0012]/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0178::"Therapeutic Direction start date/time" in
CLUSTER.therapeutic_direction.v1. If the medication order contains
multiple "Therapeutic Direction" CLUSTER, this element should be the
start time of the earliest at0178::"Therapeutic Direction start
date/time" of all contained CLUSTER.therapeutic_direction.v1.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order stop
date/time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>at0013</code>]<br />
<code>order_stop_date_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0113]/items[at0013]/value</p>
<p><strong>comment</strong>: If the medication order only contains one
"Therapeutic Direction" CLUSTER, this element should be identical with
at0179::"Therapeutic Direction stop date/time" in
CLUSTER.therapeutic_direction.v1. If the medication order contains
multiple "Therapeutic Direction" CLUSTER, this element should be the
stop time of the latest at0179::"Therapeutic Direction stop date/time"
of all contained CLUSTER.therapeutic_direction.v1.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Comment</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0167</code>]<br />
<code>comment</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/description[at0002]/items[at0167]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Timing</strong><br />
Type: <code>Parsable text</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>timing</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/timing</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td
style="text-align: left;"><p><strong>Action_archetype_id</strong><br />
Type: <code>String</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>action_archetype_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/activities[at0001]/action_archetype_id</p></td>
<td
style="text-align: left;"><p><code>Unsupported RM type: STRING</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>1..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[at0004,'Order
sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Derived_From Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>derived_from_order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[at0004,'Derived_From
Order sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Derives_To Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>derives_to_order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[at0004,'Derives_To
Order sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order group ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>order_group_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[at0004,'Order
group ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><h4
id="_unit_conversion_reference_0">Unit conversion reference
<strong>[0..*]</strong></h4>
<p><code>CLUSTER: openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1</code></p></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Unit ID</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0011</code>]<br />
<code>unit_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1]/items[at0011]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Substance ID</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0012</code>]<br />
<code>substance_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1]/items[at0012]/value</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Referenced dose</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0010</code>]<br />
<code>referenced_dose</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1]/items[at0010]/value</p>
<p><strong>comment</strong>: The exact form or syntax of the identifier
is not defined in the model. If the order only contains one dose, this
field is not necessary and should be omitted or set to the default value
"DEFAULT".</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Unit type</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>at0002</code>]<br />
<code>unit_type</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1]/items[at0002]/value</p>
<p><strong>comment</strong>: OBSOLETE - only included in the data model
for backwards compatibility.</p></td>
<td style="text-align: left;"><ul>
<li><p>SubstanceQuantityUnit<br />
<code>local:at0005</code></p></li>
<li><p>BaseQuantityUnit<br />
<code>local:at0006</code></p></li>
<li><p>ProprietaryQuantityUnit<br />
<code>local:at0007</code></p></li>
<li><p>StandardQuantityUnit<br />
<code>local:at0008</code></p></li>
<li><p>FallbackUnit<br />
<code>local:at0009</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reference ID</strong><br />
Type: <code>Text</code> (<em>0..1</em>)<br />
NodeID: [<code>at0004</code>]<br />
<code>reference_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/protocol[at0005]/items[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1]/items[at0004]/value</p>
<p><strong>comment</strong>: OBSOLETE - only included in the data model
for backwards compatibility. Must be a stable UUID for the referenced
row. The UUID itself is versioned, making an additional version data
element unnecessary.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>expiry_time</strong><br />
Type: <code>DateTime</code> (<em>0..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>expiry_time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-INSTRUCTION.medication_order.v3]/expiry_time</p></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

## **Status**

### Type: `ACTION`

### Id: `openEHR-EHR-ACTION.medication.v1`

Any activity related to the planning, scheduling, prescription
management, dispensing, administration, cessation and other use of a
medication, vaccine, nutritional product or other therapeutic item.

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 50%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Data item</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">Allowed values</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><p><strong>careflow_step</strong><br />
Type: <code>CodedText</code> (<em>0..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>careflow_step</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/ism_transition/careflow_step</p></td>
<td style="text-align: left;"><ul>
<li><p>Medication order deleted<br />
<code>local:at0150</code></p></li>
<li><p>Medication order issued<br />
<code>local:at0002</code></p></li>
<li><p>Medication order suspended<br />
<code>local:at0009</code></p></li>
<li><p>Medication order stopped<br />
<code>local:at0015</code></p></li>
<li><p>Major change to order<br />
<code>local:at0039</code></p></li>
<li><p>Medication order completed<br />
<code>local:at0007</code></p></li>
</ul></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>time</strong><br />
Type: <code>DateTime</code> (<em>1..1</em>)<br />
NodeID: [<code>RM</code>]<br />
<code>time</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/time</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Reason</strong><br />
Type: <code>Text</code> (<em>0..*</em>)<br />
NodeID: [<code>at0021</code>]<br />
<code>reason</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/description[at0017]/items[at0021]/value</p>
<p><strong>comment</strong>: For example: 'Postponed - Patient not
avalable at administration time', 'Cancelled - Adverse reaction'. Note:
This is not the reason for the medication instruction, but rather the
specific reason that a care step was carried out, and will often be used
to document some variance from the original order.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>1..1</em>)<br />
NodeID: [<code>at0103</code>]<br />
<code>order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/protocol[at0030]/items[at0103,'Order
sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Derived_From Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0103</code>]<br />
<code>derived_from_order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/protocol[at0030]/items[at0103,'Derived_From
Order sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Derives_To Order sequence
ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0103</code>]<br />
<code>derives_to_order_sequence_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/protocol[at0030]/items[at0103,'Derives_To
Order sequence ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><p><strong>Order group ID</strong><br />
Type: <code>Identifier</code> (<em>0..*</em>)<br />
NodeID: [<code>at0103</code>]<br />
<code>order_group_id</code></p></td>
<td style="text-align: left;"><p><strong>AQL</strong>:
/content[openEHR-EHR-ACTION.medication.v1,'Status']/protocol[at0030]/items[at0103,'Order
group ID']/value</p>
<p><strong>comment</strong>: Medication order groups help managing
multiple orders that should be started/stopped together, e.g. during
post-surgery recovery.</p></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>
