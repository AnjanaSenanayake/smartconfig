// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import ballerina/http;
import ballerina/url;
import ballerina/io;
import health.fhir.templates.r4.smartconfiguration.models;

# Call the discovery endpoint to get the OpenID configuration.
#
# + discoveryEndpoint - Discovery endpoint
# + return - If successful, returns OpenID configuration as a json. Else returns error.
public isolated function getOpenidConfigurations(string discoveryEndpoint) returns models:OpenIDConfiguration|error {
    LogDebug("Retrieving openid configuration started");
    string discoveryEndpointUrl = check url:decode(discoveryEndpoint, "UTF8");
    io:print(discoveryEndpointUrl);
    http:Client discoveryEpClient = check new (discoveryEndpointUrl.toString());
    models:OpenIDConfiguration openidConfiguration = check discoveryEpClient -> get("/");
    LogDebug("Retrieving openid configuration ended");
    return openidConfiguration;
}