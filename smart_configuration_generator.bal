// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import health.fhir.templates.r4.smartconfiguration.constants;
import health.fhir.templates.r4.smartconfiguration.utils;
import health.fhir.templates.r4.smartconfiguration.models;

configurable models:configs configs = ?;

# Generator function for Smart Configuration
# + return - smart configuration as a json or an error
public isolated function generateSmartConfiguration() returns models:SmartConfiguration|error {
    utils:LogDebug("Generating smart configuration started");

    models:OpenIDConfiguration openIdConfigurations = {};
    string? discoveryEndpoint = configs.discoveryEndpoint;
    if discoveryEndpoint is string && discoveryEndpoint != "" {
        openIdConfigurations = check utils:getOpenidConfigurations(discoveryEndpoint).cloneReadOnly();
    } else {
        utils:LogDebug(string `${constants:VALUE_NOT_FOUND}: discoveryEndpoint`);
    }

    string? authorizationEndpoint = configs.smartConfiguration?.authorizationEndpoint?:openIdConfigurations.authorization_endpoint?:();
    if authorizationEndpoint is () {
        return error(string `${constants:VALUE_NOT_FOUND}: Authorization endpoint`);
    }

    string? tokenEndpoint = configs.smartConfiguration?.tokenEndpoint?:openIdConfigurations.token_endpoint?:();
    if tokenEndpoint is () {
        return error(string `${constants:VALUE_NOT_FOUND}: Token endpoint`);
    }

    string[]? capabilities = configs.smartConfiguration?.capabilities?:();
    if capabilities is () {
        return error(string `${constants:VALUE_NOT_FOUND}: Capabilities`);
    }

    string[]? codeChallengeMethodsSupported = configs.smartConfiguration?.codeChallengeMethodsSupported?:openIdConfigurations.code_challenge_methods_supported?:();
    if codeChallengeMethodsSupported is () {
        return error(string `${constants:VALUE_NOT_FOUND}: Code challenge methods supported`);
    }

    string[]? grantTypesSupported = configs.smartConfiguration?.grantTypesSupported?:openIdConfigurations.grant_types_supported?:();
    if grantTypesSupported is () {
        return error(string `${constants:VALUE_NOT_FOUND}: Grant types supported`);
    }

    models:SmartConfiguration smartConfig = {
        authorization_endpoint: authorizationEndpoint, 
        token_endpoint: tokenEndpoint,
        capabilities: capabilities, 
        code_challenge_methods_supported: codeChallengeMethodsSupported, 
        grant_types_supported: grantTypesSupported,
        issuer: configs.smartConfiguration?.issuer?:openIdConfigurations.issuer?:(),
        revocation_endpoint: configs.smartConfiguration?.revocationEndpoint?:openIdConfigurations.revocation_endpoint?:(),
        introspection_endpoint: configs.smartConfiguration?.introspectionEndpoint?:openIdConfigurations.introspection_endpoint?:(),
        management_endpoint: configs.smartConfiguration?.managementEndpoint?:openIdConfigurations.management_endpoint?:(),
        registration_endpoint: configs.smartConfiguration?.registrationEndpoint?:openIdConfigurations.registration_endpoint?:(),
        jwks_uri: configs.smartConfiguration?.jwksUri?:openIdConfigurations.jwks_uri?:(),
        response_types_supported: configs.smartConfiguration?.responseTypesSupported?:openIdConfigurations.response_types_supported?:(),
        token_endpoint_auth_methods_supported: configs.smartConfiguration?.tokenEndpointAuthMethodsSupported?:openIdConfigurations.token_endpoint_auth_methods_supported?:(),
        token_endpoint_auth_signing_alg_values_supported: configs.smartConfiguration?.tokenEndpointAuthSigningAlgValuesSupported?:(),
        scopes_supported: configs.smartConfiguration?.scopesSupported?:openIdConfigurations.scopes_supported?:()
    };

    utils:LogDebug("Generating smart configuration completed ");
    return smartConfig;
}
