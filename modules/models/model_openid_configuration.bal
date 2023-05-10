// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

# OpenID configuration.
#
# + issuer - issuer  
# + authorization_endpoint - authorization endpoint
# + device_authorization_endpoint - device authorization endpoint  
# + token_endpoint - token endpoint
# + userinfo_endpoint - userinfo endpoint
# + revocation_endpoint - revocation endpoint  
# + introspection_endpoint - introspection endpoint  
# + registration_endpoint - registration endpoint
# + management_endpoint - management endpoint
# + jwks_uri - jwks uri
# + grant_types_supported - grant types supported
# + response_types_supported - response types supported
# + subject_types_supported - subject types supported
# + id_token_signing_alg_values_supported - id token signing alg values supported
# + scopes_supported - scopes supported
# + token_endpoint_auth_methods_supported - token endpoint auth methods supported
# + claims_supported - claims supported
# + code_challenge_methods_supported - code challenge methods supported
public type OpenIDConfiguration record {
    string issuer?;
    string authorization_endpoint?;
    string device_authorization_endpoint?;
    string token_endpoint?;
    string userinfo_endpoint?;
    string revocation_endpoint?;
    string introspection_endpoint?;
    string registration_endpoint?;
    string management_endpoint?;
    string jwks_uri?;
    string[] grant_types_supported?;
    string[] response_types_supported?;
    string[] subject_types_supported?;
    string[] id_token_signing_alg_values_supported?;
    string[] scopes_supported?;
    string[] token_endpoint_auth_methods_supported?;
    string[] claims_supported?;
    string[] code_challenge_methods_supported?;
};


