import ballerina/log;
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
// This file is auto-generated by WSO2 Healthcare Team for managing utility functions.
// Developers are allowed modify this file as per the requirement.
import ballerinax/health.clients.fhir;
import ballerinax/health.fhir.r4;
import ballerinax/health.fhir.r4.parser as fhirParser;
import ballerina/http;

# This util function is used to execute the FHIR interaction based on the interaction type.
#
# + resourceType - FHIR resource type  
# + fhirContext - FHIR context  
# + id - FHIR resource id  
# + payload - FHIR resource payload  
# + targetModelType - Target model type
# + return - FHIR resource or error
isolated function executeFhirInteraction(string resourceType, r4:FHIRContext fhirContext, string? id,
        r4:DomainResource? payload, typedesc<anydata> targetModelType) returns anydata|r4:FHIRError {

    r4:FHIRInteractionType interactionType = fhirContext.getInteraction().interaction;
    match interactionType {
        r4:READ => {
            if id is () {
                log:printError("ID is not provided for the read operation.");
                return r4:createFHIRError("ID is not provided for the read operation.", r4:CODE_SEVERITY_ERROR,
                    r4:TRANSIENT_EXCEPTION);
            }
            fhir:FHIRResponse|fhir:FHIRError fhirResponse = fhirConnectorObj->getById(resourceType, id);
            if fhirResponse is fhir:FHIRResponse {
                anydata|error parsedResponse = parseFhirResponse(fhirResponse, targetModelType);
                if parsedResponse is anydata {
                    return parsedResponse;
                }
                log:printError("Error occurred while parsing the response", parsedResponse);
                return r4:createFHIRError("Error occurred while parsing the response", r4:CODE_SEVERITY_ERROR,
                        r4:TRANSIENT_EXCEPTION, cause = parsedResponse);
            }
            log:printError("Error occurred while retrieving the response from Epic.");
            return r4:createFHIRError("Error occurred while retrieving the response Epic.", r4:CODE_SEVERITY_ERROR,
                r4:TRANSIENT_EXCEPTION, cause = fhirResponse);
        }
        r4:SEARCH => {
            fhir:FHIRResponse|fhir:FHIRError response = fhirConnectorObj->search(resourceType, getQueryParamsMap(
                fhirContext.getRequestSearchParameters()));
            if response is fhir:FHIRResponse {
                return <r4:Bundle>check parseFhirResponse(response, targetModelType);
            }
            log:printError("Error occurred while retrieving the response from Epic.");
            return r4:createFHIRError("Error occurred while retrieving the response from Epic.", r4:CODE_SEVERITY_ERROR,
                r4:TRANSIENT_EXCEPTION, cause = response);
        }
        r4:CREATE => {
            fhir:FHIRResponse|fhir:FHIRError response = fhirConnectorObj->create(payload.toJson());
            if response is fhir:FHIRResponse {
                anydata|error parsedResponse = parseFhirResponse(response, targetModelType);
                if parsedResponse is anydata {
                    return parsedResponse;
                }
                log:printError("Error occurred while parsing the response", parsedResponse);
                return r4:createFHIRError("Error occurred while parsing the response", r4:CODE_SEVERITY_ERROR,
                        r4:TRANSIENT_EXCEPTION, cause = parsedResponse);
            }
            log:printError("Error occurred while retrieving the response from Epic.");
            return r4:createFHIRError("Error occurred while retrieving the response from Epic.", r4:CODE_SEVERITY_ERROR,
                r4:TRANSIENT_EXCEPTION, cause = response);
        }
        _ => {
            log:printError("Unsupported interaction type.");
            return r4:createFHIRError("Unsupported interaction type.", r4:CODE_SEVERITY_ERROR,
                r4:TRANSIENT_EXCEPTION);
        }
    }
}

# This util function is used to parse given FHIR response.
#
# + fhirResponse - FHIR response from the FHIR connector 
# + targetFHIRModelType - Target FHIR model type
# + return - parsed FHIR resource or error
isolated function parseFhirResponse(fhir:FHIRResponse fhirResponse, typedesc<anydata> targetFHIRModelType) returns anydata|r4:FHIRError {
    //TODO: Should provide ability to parse bundle from the FHIR parser.
    //Refer: https://github.com/wso2-enterprise/open-healthcare/issues/1368
    json|xml resourceResult = fhirResponse.'resource;
    if resourceResult is xml {
        log:printError("XML response type is not supported.");
        return r4:createFHIRError("XML response type is not supported.", r4:CODE_SEVERITY_INFORMATION,
                r4:TRANSIENT_EXCEPTION);
    }
    if resourceResult.resourceId is string {
        //FIXME: This is a temporary fix to errorneous extarction of the resourceId from the response.
        json|error resourceId = resourceResult.'version;
        if resourceId is string {
            return {resourceId: resourceId};
        }
    }
    string|error resourceType = fhir:extractResourceType(resourceResult);
    if resourceType is error {
        log:printError("Error occurred while extracting the resource type.");
        return r4:createFHIRError("Error occurred while extracting the resource type.", r4:CODE_SEVERITY_ERROR,
                r4:TRANSIENT_EXCEPTION, cause = resourceType);
    }
    if resourceType == "Bundle" {
        json|error entries = resourceResult.entry;
        if entries is json[] {
            r4:Bundle bundle = {'type: "searchset", entry: []};
            foreach var entry in entries {
                json|error entryResource = entry.'resource;
                if entryResource is error {
                    log:printError("A valid FHIR resource is not available in the bundle entry.", entryResource);
                    continue;
                }
                anydata|error response = fhirParser:parse(entryResource, targetFHIRModelType = targetFHIRModelType).ensureType(targetFHIRModelType);
                if response is error {
                    log:printError("Error occurred while parsing the response", response);
                    return r4:createFHIRError("Error occurred while parsing the response", r4:CODE_SEVERITY_ERROR,
                                            r4:TRANSIENT_EXCEPTION, cause = response);
                }
                (<r4:BundleEntry[]>bundle.entry).push({'resource: response});
            }
            return bundle;
        }
        if entries is error {
            log:printError("Error occurred while parsing the response.", entries);
            return r4:createFHIRError("Error occurred while parsing the response.", r4:CODE_SEVERITY_ERROR,
                            r4:TRANSIENT_EXCEPTION, cause = entries);
        }
    }
    //single resource parsing
    anydata|error response = fhirParser:parse(resourceResult, targetFHIRModelType = targetFHIRModelType).ensureType(targetFHIRModelType);
    if response is error {
        log:printError("Error occurred while parsing the response", response);
        return r4:createFHIRError("Error occurred while parsing the response", r4:CODE_SEVERITY_ERROR,
                                r4:TRANSIENT_EXCEPTION, cause = response);
    }
    return response;
}

isolated function getQueryParamsMap(map<r4:RequestSearchParameter[] & readonly> requestSearchParameters) returns map<string[]> {
    //TODO: Should provide ability to get the query parameters from the context as it is from the http request. 
    //Refer : https://github.com/wso2-enterprise/open-healthcare/issues/1369
    map<string[]> queryParameters = {};
    foreach var key in requestSearchParameters.keys() {
        r4:RequestSearchParameter[] & readonly searchParameters = requestSearchParameters[key] ?: [];
        foreach var searchParameter in searchParameters {
            string name = searchParameter.name;
            if queryParameters[name] is string[] {
                (<string[]>queryParameters[name]).push(searchParameter.value);
            } else {
                queryParameters[name] = [searchParameter.value];
            }
        }
    }
    return queryParameters;
}

isolated function buildCreateInteractionResponse(string context, map<anydata> responsePayload) returns http:Response {

    http:Response response = new;
    if responsePayload.hasKey("resourceId") {
        //rewrite the location header
        string location = string `${baseServerHost}/${context}/${responsePayload["resourceId"].toString()}`;
        response.addHeader("Location", location);
    } else {
        response.setPayload(responsePayload.toJson());
    }
    response.statusCode = 201;
    return response;
}
