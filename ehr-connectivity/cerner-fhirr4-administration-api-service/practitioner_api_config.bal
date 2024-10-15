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

final r4:ResourceAPIConfig practitionerApiConfig = {
    resourceType: "Practitioner",
    profiles: [
            "http://hl7.org/fhir/StructureDefinition/Practitioner"        
    ],
    defaultProfile: (),
    searchParameters: [
            {
        name: "communication",
        active: true,
        information: {
            description: "One of the languages that the practitioner can communicate with",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/Practitioner-communication"
        }
    },
            {
        name: "name",
        active: true,
        information: {
            description: "A server defined search that may match any of the string fields in the HumanName, including family, give, prefix, suffix, suffix, and/or text",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/Practitioner-name"
        }
    },
            {
        name: "email",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A value in an email contact",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-email"
        }
    },
            {
        name: "address",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address"
        }
    },
            {
        name: "active",
        active: true,
        information: {
            description: "Whether the practitioner record is active",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/Practitioner-active"
        }
    },
            {
        name: "address-use",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A use code specified in an address",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address-use"
        }
    },
            {
        name: "phonetic",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A portion of either family or given name using some kind of phonetic matching algorithm",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-phonetic"
        }
    },
            {
        name: "address-country",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A country specified in an address",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address-country"
        }
    },
            {
        name: "phone",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A value in a phone contact",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-phone"
        }
    },
            {
        name: "identifier",
        active: true,
        information: {
            description: "A practitioner's Identifier",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
        }
    },
            {
        name: "address-city",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A city specified in an address",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address-city"
        }
    },
            {
        name: "gender",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): Gender of the practitioner",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-gender"
        }
    },
            {
        name: "telecom",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): The value in any kind of contact",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-telecom"
        }
    },
            {
        name: "address-state",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A state specified in an address",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address-state"
        }
    },
            {
        name: "given",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A portion of the given name",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-given"
        }
    },
            {
        name: "address-postalcode",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A postalCode specified in an address",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
        }
    },
            {
        name: "family",
        active: true,
        information: {
            description: "[Practitioner](practitioner.html): A portion of the family name",
            builtin: false,
            documentation: "http://hl7.org/fhir/SearchParameter/individual-family"
        }
    }
        ],
    operations: [
    ],
    serverConfig: (),
    authzConfig: ()
};
