Logical: MedicationOrder
Title: "cistec.openehr.medication_order.v1"
Parent: Element
Description: """[openEHR-EHR-COMPOSITION.request.v1] Document sent from one treating healthcare provider or organisation to another, for the purpose of requesting advice, a service or transfer of care."""
* ^name = "MedicationOrder"
* ^status = #active
* ^version = "1.0.0"
* ^url = "http://openehr.org/StructureDefinition/MedicationOrder"
* category 1..1 CodedText "category" """[RM] Temporal category of this Composition, persistent / episodic or event."""
* category from MedicationOrderCategory (required)
* composer 1..1 Party "composer" """[RM] The person primarily responsible for the content of the Composition (but not necessarily its committal into the EHR system). This is the identifier which should appear on the screen. It may or may not be the person who entered the data. When it is the patient, the special self instance of `PARTY_SELF` will be used."""
* context 1..1 EventContext "context" """[RM] `COMPOSITION.context` - Documents the context information of a healthcare event involving the subject of care and the health system. The context information recorded here are independent of the attributes recorded in the version audit, which document the system interaction context, i.e. the context of a user interacting with the health record system. Healthcare events include patient contacts, and any other business activity, such as pathology investigations which take place on behalf of the patient."""
  * startTime 1..1 DateTime "start_time" """[RM] COMPOSITION.context.start_time - Start time of the clinical session or other kind of event during which a provider performs a service of any kind for the patient."""
  * setting 1..1 CodedText "setting" """[RM] The setting in which the clinical session took place. Coded using the openEHR Terminology, setting group."""
  * setting from MedicationOrderSetting (required)
  * caseIdentification 1..1 Cluster "Case identification" """[openEHR-EHR-CLUSTER.case_identification.v0] To record case identification details for public health purposes."""
    * caseIdentifier 1..1 Text "Case identifier" """[at0001] The identifier of this case."""
* MedicationOrder 1..1 Instruction "Medication order" """[openEHR-EHR-INSTRUCTION.medication_order.v3] An order for a medication, vaccine, nutritional product or other therapeutic item for an identified individual."""
  * narrative 1..1 Text "narrative" """[RM] """
    * medicationItem 1..1 Text "Medication item" """[at0070] Name of the medication, vaccine or other therapeutic/prescribable item being ordered."""
    * medicationDetails 0..1 Cluster "Medication details" """[openEHR-EHR-CLUSTER.medication.v2] Details about the overall ordered medication, including strength, form and details of any specific constituents."""
      * name 1..1 Text "Name" """[at0132] The name of the ordered medication product or article.
"""
      * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
      * category from MedicationOrderCategory2 (required)
      * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
        * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
        * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
      * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
      * stockSolution 0..* Cluster "Stock solution" """[openEHR-EHR-CLUSTER.medication.v2] Details about the stock solution of a mixture, including strength, form and details of any specific constituents."""
        * name 1..1 Text "Name" """[at0132] The name of the stock solution."""
        * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
        * category from MedicationOrderCategory3 (required)
        * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
          * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
          * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
        * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
        * medicationComponent 0..* Cluster "Medication component" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication product or component of a medication, including strength, form and details of any specific constituents."""
          * name 1..1 Text "Name" """[at0132] The name of the medication product or medication component."""
          * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
          * category from MedicationOrderCategory4 (required)
          * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
            * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
            * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
          * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
          * substance 0..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication ingredient, including strength, form and amount."""
            * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
            * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
            * category from MedicationOrderCategory5 (required)
            * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
              * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
              * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
            * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
            * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
            * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
            * role from MedicationOrderRole (required)
            * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
              * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
              * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
              * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
              * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
            * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
              * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
          * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of medication or medication component."""
          * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
            * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
            * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
            * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
            * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
          * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
            * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
        * solvent 0..* Cluster "Solvent" """[openEHR-EHR-CLUSTER.medication.v2] Details about the solvent of the mixture, including strength, form and details of any specific constituents."""
          * name 1..1 Text "Name" """[at0132] The name of the solvent."""
          * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
          * category from MedicationOrderCategory6 (required)
          * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
            * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
            * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
          * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
          * substance 0..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about an ingredient of the solvent, including strength, form and amount."""
            * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
            * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
            * category from MedicationOrderCategory7 (required)
            * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
              * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
              * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
            * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
            * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
            * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
            * role from MedicationOrderRole2 (required)
            * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
              * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
              * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
              * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
              * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
            * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
              * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
          * role 0..1 CodedText "Role" """[at0127] The role of the solvent within a mixture."""
          * role from MedicationOrderRole3 (required)
          * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
            * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
            * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
            * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
            * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
          * solventSelection 0..1 Cluster "Solvent selection" """[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1] Details about whether a solvent is required or represents an alternative option for medication preparation."""
            * mediumUse 1..1 CodedText "Medium use" """[at0001] The intended use of this mixture medium in the medication order."""
            * mediumUse from MedicationOrderMediumUse (required)
            * optionIdentifier 1..1 Identifier "Option identifier" """[at0005] Identifier of a specific option within an option group."""
            * selectionRule 0..1 CodedText "Selection rule" """[at0006] Rule for selecting options from the option group."""
            * selectionRule from MedicationOrderSelectionRule (preferred)
          * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
            * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
        * substance 0..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about an ingredient of the stock solution, including strength, form and amount."""
          * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
          * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
          * category from MedicationOrderCategory8 (required)
          * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
            * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
            * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
          * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
          * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
          * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
          * role from MedicationOrderRole4 (required)
          * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
            * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
            * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
            * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
            * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
          * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
            * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
        * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of medication or medication component."""
        * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
          * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
          * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
          * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
          * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
      * carrierSolution 0..* Cluster "Carrier solution" """[openEHR-EHR-CLUSTER.medication.v2] Details about the carrier solution of a mixture, including strength, form and details of any specific constituents."""
        * name 1..1 Text "Name" """[at0132] The name of the carrier solution."""
        * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
        * category from MedicationOrderCategory9 (required)
        * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
          * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
          * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
        * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
        * substance 0..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about an ingredient of the carrier solution, including strength, form and amount."""
          * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
          * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
          * category from MedicationOrderCategory10 (required)
          * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
            * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
            * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
          * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
          * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
          * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
          * role from MedicationOrderRole5 (required)
          * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
            * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
            * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
            * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
            * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
          * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
            * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
        * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of medication or medication component."""
        * role 0..1 CodedText "Role" """[at0127] The role of the carrier solution within a mixture."""
        * role from MedicationOrderRole6 (required)
        * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
          * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
          * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
          * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
          * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
        * carrierSolutionSelection 0..1 Cluster "Carrier solution selection" """[openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1] Details about whether a carrier solution or solvent is required or represents an alternative option for medication preparation."""
          * mediumUse 1..1 CodedText "Medium use" """[at0001] The intended use of this mixture medium in the medication order."""
          * mediumUse from MedicationOrderMediumUse2 (required)
          * optionIdentifier 1..1 Identifier "Option identifier" """[at0005] Identifier of a specific option within an option group."""
          * selectionRule 0..1 CodedText "Selection rule" """[at0006] Rule for selecting options from the option group."""
          * selectionRule from MedicationOrderSelectionRule2 (preferred)
        * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
          * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
      * medicationComponent 0..* Cluster "Medication component" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication product or component of a medication, including strength, form and details of any specific constituents."""
        * name 1..1 Text "Name" """[at0132] The name of the medication or medication component."""
        * category 0..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
        * category from MedicationOrderCategory11 (required)
        * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
          * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
          * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
        * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
        * substance 1..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication ingredient, including strength, form and amount."""
          * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
          * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
          * category from MedicationOrderCategory12 (required)
          * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
            * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
            * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
          * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
          * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
          * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
          * role from MedicationOrderRole7 (required)
          * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
            * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
            * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
            * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
            * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
          * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
            * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
        * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of medication or medication component."""
        * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
          * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
          * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
          * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
          * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
        * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
          * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
      * substance 0..* Cluster "Substance" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication ingredient, including strength, form and amount."""
        * name 1..1 Text "Name" """[at0132] The name of the medication ingredient."""
        * category 1..1 CodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
        * category from MedicationOrderCategory13 (required)
        * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
          * strengthNumerator 1..1 Quantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
          * strengthDenominator 1..1 Quantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
        * strengthConcentration 0..1 Quantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
        * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of the medication ingredient."""
        * role 0..1 CodedText "Role" """[at0127] The role of the substance within the medication product."""
        * role from MedicationOrderRole8 (required)
        * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
          * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
          * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
          * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
          * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
        * doseLead 0..1 Cluster "Dose lead" """[openEHR-EHR-CLUSTER.dose_lead_cistec.v1] Identification of a medication component used as the basis for dose calculation."""
          * isDoseLead 1..1 Boolean "Is dose lead" """[at0002] Indicates whether this medication component was used as the basis for dose calculation."""
      * amount 0..1 Quantity "Amount" """[at0139  | ] The amount of medication or medication component."""
      * description 0..1 Text "Description" """[at0133] Narrative description of the medication or medication component where it is not possible to describe this fully using structured elements."""
      * knowledgeBaseReference 0..* Cluster "Knowledge base reference" """[openEHR-EHR-CLUSTER.knowledge_base_reference.v1] A citation of a digital resource used as an source of authoritative or expert information, and/or to items contained within the resource."""
        * knowledgeBaseName 1..1 Text "Knowledge base name" """[at0001] The name of the knowledge base."""
        * knowledgeBaseVersion 0..1 Text "Knowledge base version" """[at0006] The version of the referenced knowledge base."""
        * codeName 0..1 Text "Code name" """[at0005] The name of the referenced item within the knowledge base."""
        * itemURI 1..1 ExternalURI "Item URI" """[at0003] The hyperlink to the referenced item within the knowledge base."""
    * route 1..1 CodedText "Route" """[at0091] The route by which the ordered item is to be administered into the subject's body.

The value set represents the whole set as defined by FHIR Switzerland in the implementation guide for CH EMED, where EDQM is considered binding for route of administration (mandatory) at 
https://fhir.ch/ig/ch-term/3.0.0/ValueSet-edqm-routeofadministration.html
"""
    * route from MedicationOrderRoute (required)
    * bodySite 0..1 Text "Body site" """[at0092] Name of the site of administration of the ordered item."""
    * administrationMethod 0..1 CodedText "Administration method" """[at0094] The technique or device by which the ordered item is to be administered.

The value set represents the whole set as defined by FHIR Switzerland in the implementation guide for CH EMED, where EDQM is considered binding for administration method (mandatory) at 
https://fhir.ch/ig/ch-term/3.0.0/ValueSet-edqm-administrationmethod.html"""
    * administrationMethod from MedicationOrderAdministrationMethod (required)
    * installation 0..* Cluster "Installation" """[openEHR-EHR-CLUSTER.device.v1] An instrument, apparatus, implant, material or similar, used in the provision of healthcare. In this context, a medical device includes a broad range of devices which act through a variety of physical, mechanical, thermal or similar means but specifically excludes devices which act through medicinal means such as pharmacological, metabolic or immunological methods.  The scope is inclusive of disposable devices as well as durable or persisting devices that require tracking, maintenance activities or regular calibration, recognising that each type of device has specific data recording requirements."""
      * deviceName 1..1 Text "Device name" """[at0001] Identification of the medical device, preferably by a common name, a formal fully descriptive name or, if required, by class or category of device."""
      * lumen 0..* Cluster "Lumen" """[openEHR-EHR-CLUSTER.device.v1] The specific lumen (internal tube) in multi-lumen catheters that was used for this administration."""
        * lumenName 1..1 Text "Lumen name" """[at0001] Identification of the lumen, preferably by a common name, a formal fully descriptive name or, if required, by class or category of lumen."""
        * type 0..1 CodedText "Type" """[at0003] The category or kind of device."""
        * type from MedicationOrderType (required)
        * description 0..1 Text "Description" """[at0002] Narrative description of the lumen."""
    * once 0..* Cluster "Once" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order."""
      * dosage 1..1 Cluster "Dosage" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
        * dose 1..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingOnce 0..1 Cluster "Timing once" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * pointInTimeForApplication 0..1 Time "Point in time for application" """[at0004] A specific time or interval of time when the activity should occur."""
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
    * periodically 0..* Cluster "Periodically" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order."""
      * dosage 1..1 Cluster "Dosage" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
        * dose 1..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingDaily 0..1 Cluster "Timing - daily" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * repetitionIntervalForHoursAndMinutes 0..1 Duration "Repetition interval for hours and minutes" """[at0014] The time interval or minimum and maximum range of an interval between each scheduled activity."""
          * specificTimeForFirstApplication 0..1 Time "Specific time for first application" """[at0004] A specific time when the activity should first occur, and start the periodicity."""
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
      * timingNonDaily 0..1 Cluster "Timing - non-daily" """[openEHR-EHR-CLUSTER.timing_nondaily.v1] Structured information about the intended timing pattern for a therapeutic or diagnostic activity occurring over days, weeks, months or years."""
        * repetitionIntervalForDays 0..1 Duration "Repetition interval for days" """[at0002] The interval between repetitions of the activity."""
        * specificDateForFirstApplication[x] 0..1 Date or DV_INTERVAL<Date> "Specific date for first application" "at0001: A specific date when the activity should first occur, and start the periodicity."
    * schema 0..* Cluster "Schema" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a "Schema" therapeutic direction for an ordered item, such as a medication or blood transfusion order."""
      * morning 0..1 Cluster "Morning" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for the "morning" period, in the context of a "Schema" medication order."""
        * dose 0..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingMorning 0..1 Cluster "Timing morning" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within the morning."""
          * timePeriodForApplication[x] 1..1 Time or DV_INTERVAL<Time> "Time period for application" "at0004: A specific time or interval of time when the activity should occur."
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * noon 0..1 Cluster "Noon" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for the "noon" period, in the context of a "Schema" medication order."""
        * dose 0..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingNoon 0..1 Cluster "Timing noon" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within midday."""
          * timePeriodForApplication[x] 1..1 Time or DV_INTERVAL<Time> "Time period for application" "at0004: A specific time or interval of time when the activity should occur."
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * evening 0..1 Cluster "Evening" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for the "evening" period, in the context of a "Schema" medication order."""
        * dose 0..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingEvening 0..1 Cluster "Timing evening" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within the evening."""
          * timePeriodForApplication[x] 1..1 Time or DV_INTERVAL<Time> "Time period for application" "at0004: A specific time or interval of time when the activity should occur."
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * night 0..1 Cluster "Night" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for the "night" period, in the context of a "Schema" medication order."""
        * dose 0..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingNight 0..1 Cluster "Timing night" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within the night."""
          * timePeriodForApplication[x] 1..1 Time or DV_INTERVAL<Time> "Time period for application" "at0004: A specific time or interval of time when the activity should occur."
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
    * dayPlan 0..* Cluster "Day plan" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order, that should be administered on a day plan (every day at specific times)."""
      * timeEvent 1..* Cluster "Time event" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
        * dose 1..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingDaily 1..* Cluster "Timing - daily" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * pointInTimeForApplication 1..1 Time "Point in time for application" """[at0004] A specific time when the activity should occur."""
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
    * weekPlan 0..* Cluster "Week plan" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order, that should be administered following a week plan."""
      * dosage 1..* Cluster "Dosage" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
        * dose 1..1 Quantity "Dose" """[at0144  | AnwBlistBtlDosDosierpipDosiersprELFlTropfHubMBMLPckPflStkTubeTeilpckTLN/AEMio EIEMio IEngmcgmggmlnmolmcmolmmolppmJkJcalkcalBqkBqMBqGBq] The amount of medication administered at one time."""
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingDaily 1..* Cluster "Timing - daily" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * pointInTimeForApplication 1..* Time "Point in time for application" """[at0004] A specific time when the activity should occur."""
          * asRequired 0..1 Boolean "As required" """[at0024] Record as True if the medication should only be administered at the time specified in the "Therapeutic Direction" if required by the patient."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
      * timingNonDaily 1..1 Cluster "Timing - non-daily" """[openEHR-EHR-CLUSTER.timing_nondaily.v1] Structured information about the intended timing pattern for a therapeutic or diagnostic activity occurring over days, weeks, months or years."""
        * specificDayOfWeek 1..7 CodedText "Specific day of week" """[at0003] The activity should take place on a specific day of the week."""
        * specificDayOfWeek from MedicationOrderSpecificDayOfWeek (required)
    * conditional 0..* Cluster "Conditional" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order, that does not have a fixed schedule but is conditional and should be administered when a certain criterion is met."""
      * dosage 1..1 Cluster "Dosage" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
        * dose[x] 1..1 Quantity or DV_INTERVAL<Quantity> "Dose" "at0144: The amount of medication administered at one time."
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timing 0..1 Cluster "Timing" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * minimumInterval 0..1 Duration "Minimum interval" """[at0014] The minimum time interval between each scheduled activity. Cannot be >24 hours."""
          * isConditional 1..1 Boolean "Is conditional" """[at0024] Record as True if the activity should only occur when the conditional criterion is met."""
          * conditionalCriterion 0..1 Text "Conditional criterion" """[at0025] The condition which triggers a conditional administration."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
      * conditionalMedicationInstructionsOR 0..* Cluster "Conditional medication instructions - OR" """[openEHR-EHR-CLUSTER.conditional_medication_rules_cistec.v1] Details of conditions on which determine the dose amount or administration rate."""
        * conditionRuleAND 0..* Cluster "Condition rule - AND" """[at0005] Details of the condition and associated dose amount or administration rate."""
          * conditionName 0..1 Text "Condition name" """[at0008] The name or short description of the condition which is required for the associated dose amount or admistration to be applied."""
          * condition[x] 0..1 Quantity or DV_INTERVAL<Quantity> or Count or DV_INTERVAL<Count> or Proportion or Text or Boolean "Condition" "at0002: The value which is required for the associated dose amount or admistration to be applied."
    * rateTherapy 0..1 Cluster "Rate therapy" """[openEHR-EHR-CLUSTER.therapeutic_direction.v1] Structured details of a single therapeutic direction for an ordered item, such as a medication or blood transfusion order, as a rate therapy, where not the total amount of administered medication, but the administration rate is the primary parameter."""
      * rate 1..1 Cluster "Rate" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management.
Here in the context of a rate therapy, where the administration rate is the main parameter."""
        * doseFormula[x] 0..1 Text or Quantity "Dose formula" "at0135: The formula used to calculate the dose amount or administration rate where this is dependent on some other factor, such as body weight or surface area."
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timingDaily 0..1 Cluster "Timing - daily" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * specificTimeForFirstApplication[x] 0..1 Time or DV_INTERVAL<Time> "Specific time for first application" "at0004: A specific time or time interval when the activity should first occur."
        * administrationRate[x] 1..1 Quantity or Text "Administration rate" "at0134: The rate at which the medication, such as an infusion, is to be administered."
      * bolus 0..1 Cluster "Bolus" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management.
Here in the context of a rate therapy, as an optional bolus injection in addition to the regular rate order."""
        * dose[x] 1..1 Quantity or DV_INTERVAL<Quantity> "Dose" "at0144: The amount of medication administered at one time."
        * referenceSubstance 0..1 Text "Reference substance" """[at0178] Identifies the specific substance (ingredient) to which the documented "Dose" quantity refers."""
        * timing 0..1 Cluster "Timing" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
          * minimumInterval 0..1 Duration "Minimum interval" """[at0014] The minimum time interval between each bolus injection. Cannot be >24 hours."""
        * administrationDuration[x] 0..1 Duration or DV_INTERVAL<Duration> "Administration duration" "at0102: The period of time over which a single dose of the medication or vaccine should be administered."
      * therapeuticDirectionStartDateTime 1..1 DateTime "Therapeutic Direction start date/time" """[at0178] The date and optional time to commence the administration of this specific Therapeutic Direction."""
      * therapeuticDirectionStopDateTime 0..1 DateTime "Therapeutic Direction stop date/time" """[at0179] The date and optional time when it is planned to cease the administration of this specific Therapeutic Direction."""
    * medicationSafety 0..1 Cluster "Medication safety" """[at0062] Details about medication safety for the ordered item."""
      * maximumDose 0..* Cluster "Maximum dose" """[at0051] Details about the maximum, cumulative dose allowed over a defined period for the ordered item."""
        * maximumAmount 1..1 Quantity "Maximum amount" """[at0130  | ] The maximum, cumulative amount of medication which should be administered within the allowed period."""
        * allowedPeriod 1..1 Duration "Allowed period" """[at0053] The period of time during which the maximum dose is calculated."""
    * clinicalIndication 0..* Text "Clinical indication" """[at0018] The clinical reason for use of the ordered item."""
    * orderDetails 0..1 Cluster "Order details" """[at0113] Details about the whole medication order."""
      * orderStartDateTime 1..1 DateTime "Order start date/time" """[at0012] The date and optional time to commence use of the ordered item for this entire medication order."""
      * orderStopDateTime 0..1 DateTime "Order stop date/time" """[at0013] The date and optional time when it is planned to cease use of the ordered item for this entire medication order."""
    * comment 0..1 Text "Comment" """[at0167] Additional narrative about the medication order not captured in other fields."""
    * timing 1..1 Parsable text "Timing" """[RM] """
    * actionArchetypeId 1..1 String "Action_archetype_id" """[RM] """
  * orderSequenceID 1..1 Identifier "Order sequence ID" """[at0004] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * derivedFromOrderSequenceID 0..* Identifier "Derived_From Order sequence ID" """[at0004] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * derivesToOrderSequenceID 0..* Identifier "Derives_To Order sequence ID" """[at0004] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * orderGroupID 0..* Identifier "Order group ID" """[at0004] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * unitConversionReference 0..* Cluster "Unit conversion reference" """[openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1] Carries an implementation-specific reference that indicates which entry within the reference dataset enables calculation between the recorded dose unit and other units."""
    * unitID 0..1 Text "Unit ID" """[at0011] UUID of the unit that defines the conversion of the ordered medication dose."""
    * substanceID 0..1 Text "Substance ID" """[at0012] UUID of the substance that defines the conversion of the ordered medication dose."""
    * referencedDose 0..1 Text "Referenced dose" """[at0010] Identifier or label for the specific dose that is referenced by this CLUSTER instance. Used for medication orders that contain two or more different doses."""
    * unitType 0..1 CodedText "Unit type" """[at0002] Indicates which conversion table/category is applicable for resolving this unit."""
    * unitType from MedicationOrderUnitType (required)
    * referenceID 0..1 Text "Reference ID" """[at0004] UUID of the record in the selected table ("Unit type") that defines the conversion for this unit."""
  * expiryTime 0..1 DateTime "expiry_time" """[RM] """
* Status 1..1 Action "Status" """[openEHR-EHR-ACTION.medication.v1] Any activity related to the planning, scheduling, prescription management, dispensing, administration, cessation and other use of a medication, vaccine, nutritional product or other therapeutic item."""
  * careflowStep 0..1 CodedText "careflow_step" """[RM] `ISM_TRANSITION.care_flow_step` - The step in the careflow process which occurred as part of generating this action, e.g. dispense , start_administration. This attribute represents the clinical label for the activity, as opposed to current_state which represents the state machine (ISM) computable form. Defined in archetype."""
  * careflowStep from MedicationOrderCareflowStep (required)
  * time 1..1 DateTime "time" """[RM] `ACTION.time` - Point in time at which this action took place."""
  * reason 0..* Text "Reason" """[at0021] Reason that the pathway step for the identified medication was carried out."""
  * orderSequenceID 1..1 Identifier "Order sequence ID" """[at0103] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * derivedFromOrderSequenceID 0..* Identifier "Derived_From Order sequence ID" """[at0103] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * derivesToOrderSequenceID 0..* Identifier "Derives_To Order sequence ID" """[at0103] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""
  * orderGroupID 0..* Identifier "Order group ID" """[at0103] Unique identifier for a medication order group that this medication order is part of. A medication order can be part of multiple groups at the same time."""

ValueSet: MedicationOrderCategory
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory"
* http://openehr.org/archetypes/openEHR-EHR-COMPOSITION.request.v1/CS#433 "event"


ValueSet: MedicationOrderSetting
Title: "cistec.openehr.medication_order.v1: MedicationOrderSetting"


ValueSet: MedicationOrderCategory2
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory2"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0143 "Ad-hoc mixture"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0001 "Combination product"


ValueSet: MedicationOrderCategory3
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory3"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0143 "Ad-hoc mixture"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0001 "Combination product"


ValueSet: MedicationOrderCategory4
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory4"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"


ValueSet: MedicationOrderCategory5
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory5"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderCategory6
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory6"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0143 "Ad-hoc mixture"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"


ValueSet: MedicationOrderCategory7
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory7"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole2
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole2"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderRole3
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole3"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderMediumUse
Title: "cistec.openehr.medication_order.v1: MedicationOrderMediumUse"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0002 "Required"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0003 "Alternative"


ValueSet: MedicationOrderSelectionRule
Title: "cistec.openehr.medication_order.v1: MedicationOrderSelectionRule"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0007 "Exactly one option"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0008 "One or more options"


ValueSet: MedicationOrderCategory8
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory8"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole4
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole4"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderCategory9
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory9"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0143 "Ad-hoc mixture"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"


ValueSet: MedicationOrderCategory10
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory10"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole5
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole5"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderRole6
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole6"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderMediumUse2
Title: "cistec.openehr.medication_order.v1: MedicationOrderMediumUse2"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0002 "Required"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0003 "Alternative"


ValueSet: MedicationOrderSelectionRule2
Title: "cistec.openehr.medication_order.v1: MedicationOrderSelectionRule2"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0007 "Exactly one option"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.mixture_medium_selection_cistec.v1/CS#at0008 "One or more options"


ValueSet: MedicationOrderCategory11
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory11"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"


ValueSet: MedicationOrderCategory12
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory12"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole7
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole7"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderCategory13
Title: "cistec.openehr.medication_order.v1: MedicationOrderCategory13"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"


ValueSet: MedicationOrderRole8
Title: "cistec.openehr.medication_order.v1: MedicationOrderRole8"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: MedicationOrderRoute
Title: "cistec.openehr.medication_order.v1: MedicationOrderRoute"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20001000 "Anwendung am Ohr"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20002500 "Buccale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20003000 "Anwendung auf der Haut"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20004000 "dentale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20006000 "endozervikale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20007000 "Anwendung in den Nebenhöhlen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20008000 "endotracheopulmonale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20009000 "epidurale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20010000 "zum Auftragen auf die Wunde"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20011000 "extraamniotische Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20011500 "extrakorporale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20087000 "extrapleurale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20013000 "gastrointestinale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20013500 "zur Anwendung mittels Magensonde"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20014000 "Anwendung am Zahnfleisch"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20015000 "Hämodialyse"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20015500 "zur Implantation"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20019500 "Infiltration"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20020000 "zur Inhalation"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20021000 "intestinale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20022000 "intraamniotische Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20023000 "intraarterielle Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20024000 "intraartikuläre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20025000 "intrabursale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20025500 "intrakamerale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20026000 "intracardiale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20026500 "intrakartilaginäre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20027000 "intrakavernöse Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20027010 "Intrazerebrale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20028000 "intrazervikale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20028300 "zur Anwendung in der Cholangiopankreatikographie"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20028500 "intracisternale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20029000 "intrakoronare Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20030000 "intradermale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20031000 "intradiskale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20031500 "intraepidermale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20031700 "intraglanduläre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20032000 "intraläsionale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20033000 "intralymphatische Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20035000 "intramuskuläre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20036000 "intraokulare Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20036500 "intraossäre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20037000 "Intraperikardial"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20038000 "intraperitoneale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20039000 "intrapleurale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20039200 "intraportale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20039500 "intraprostatische Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20041000 "intrasternale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20042000 "intrathekale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20043000 "intratumorale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20044000 "intrauterine Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20045000 "intravenöse Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20046000 "intravesikale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20047000 "Intravitreal"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20047500 "zur Iontophorese"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20048000 "zur Anwendung im Rachen und am Kehlkopf"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20049000 "nasale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20051000 "Anwendung am Auge"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20053000 "zum Einnehmen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20054000 "Anwendung in der Mundhöhle"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20055000 "zur Anwendung im Mund- und Rachenraum"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20057000 "periartikuläre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20058000 "perineurale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20059000 "zur periodontalen Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20059300 "periossäre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20059400 "peritumorale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20059500 "posteriore juxtasclerale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20061000 "rektale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20061500 "retrobulbäre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20062000 "Art der Anwendung nicht spezifizierbar"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20063000 "Einritzen der Haut"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20065000 "subkonjunktivale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20066000 "subkutane Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20067000 "Sublingual"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20067500 "submuköse Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20070000 "transdermale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20071000 "Anwendung in der Harnröhre"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20072000 "vaginale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20080000 "intracerebroventrikuläre Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20081000 "subretinale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20084000 "intracorneale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20086000 "Intraputaminale Anwendung"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#20088000 "periläsionale Anwendung"


ValueSet: MedicationOrderAdministrationMethod
Title: "cistec.openehr.medication_order.v1: MedicationOrderAdministrationMethod"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0004 "Administration"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0005 "Applikation"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0006 "Baden"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0007 "Kauen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0008 "Gurgeln"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0009 "Infusion"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0010 "Inhalation"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0011 "Injektion"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0012 "Insertion"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0013 "Instillation"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0014 "Orodispersion"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0015 "Spülen/Waschen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0017 "Sprühen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0018 "Lutschen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0019 "Schlucken"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0020 "Keine Angaben"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0111 "Brennen"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0112 "Dialyse"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.medication_order.v3/CS#0113 "Implantation"


ValueSet: MedicationOrderType
Title: "cistec.openehr.medication_order.v1: MedicationOrderType"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.device.v1/CS#257369004 "Single lumen tube"


ValueSet: MedicationOrderSpecificDayOfWeek
Title: "cistec.openehr.medication_order.v1: MedicationOrderSpecificDayOfWeek"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0007 "Monday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0008 "Tuesday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0016 "Wednesday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0017 "Thursday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0018 "Friday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0019 "Saturday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0020 "Sunday"


ValueSet: MedicationOrderUnitType
Title: "cistec.openehr.medication_order.v1: MedicationOrderUnitType"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1/CS#at0005 "SubstanceQuantityUnit"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1/CS#at0006 "BaseQuantityUnit"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1/CS#at0007 "ProprietaryQuantityUnit"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1/CS#at0008 "StandardQuantityUnit"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.unit_conversion_reference_cistec.v1/CS#at0009 "FallbackUnit"


ValueSet: MedicationOrderCareflowStep
Title: "cistec.openehr.medication_order.v1: MedicationOrderCareflowStep"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0150 "Medication order deleted"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0002 "Medication order issued"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0009 "Medication order suspended"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0015 "Medication order stopped"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0039 "Major change to order"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0007 "Medication order completed"
