// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.
//
//
// AUTO-GENERATED FILE. DO NOT MODIFY.
//
// This file is auto-generated by WSO2 Healthcare Team for managing utility functions.
// Developers are allowed modify this file as per the requirement.

import ballerinax/health.fhir.r4;

final r4:ResourceAPIConfig relatedPersonApiConfig = {
    resourceType: "RelatedPerson",
    profiles: [
        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-relatedperson"
    ],
    defaultProfile: (),
    searchParameters: [
        {
            name: "patient",
            active: true,
            information: {
                description: "**The patient this related person is related to**  **NOTE**: This US Core SearchParameter definition extends the usage context of the[Conformance expectation extension](http://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) - multipleAnd - multipleOr - comparator - modifier - chain",
                builtin: false,
                documentation: "http://hl7.org/fhir/us/core/SearchParameter/us-core-relatedperson-patient"
            }
        },
        {
            name: "_id",
            active: true,
            information: {
                description: "**Logical id of this artifact**  **NOTE**: This US Core SearchParameter definition extends the usage context of the[Conformance expectation extension](http://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) - multipleAnd - multipleOr - comparator - modifier - chain",
                builtin: false,
                documentation: "http://hl7.org/fhir/us/core/SearchParameter/us-core-relatedperson-id"
            }
        },
        {
            name: "name",
            active: true,
            information: {
                description: "**A server defined search that may match any of the string fields in the HumanName, including family, give, prefix, suffix, suffix, and/or text**  **NOTE**: This US Core SearchParameter definition extends the usage context of the[Conformance expectation extension](http://hl7.org/fhir/R4/extension-capabilitystatement-expectation.html) - multipleAnd - multipleOr - comparator - modifier - chain",
                builtin: false,
                documentation: "http://hl7.org/fhir/us/core/SearchParameter/us-core-relatedperson-name"
            }
        }
    ],
    operations: [

    ],
    serverConfig: ()
,
    authzConfig: ()
};
