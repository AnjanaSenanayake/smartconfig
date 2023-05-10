// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.

// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein is strictly forbidden, unless permitted by WSO2 in accordance with
// the WSO2 Software License available at: https://wso2.com/licenses/eula/3.2
// For specific language governing the permissions and limitations under
// this license, please see the license as well as any agreement you’ve
// entered into with WSO2 governing the purchase of this software and any
// associated services.

import ballerina/log;

# Debug logger.
# 
# + msg - debug message 
public isolated function LogDebug(string msg) {
    log:printDebug(msg);
}

# Error logger.
#
# + err - error message
public isolated function LogError(error err) {
    log:printError(string `message: ${err.detail().toString()}, stacktrace: ${err.stackTrace().toString()}`);
}

# Info logger.
# 
# + msg - info message 
public isolated function LogInfo(string msg) {
    log:printInfo(msg);
}

# Warn logger.
# 
# + msg - warn message 
public isolated function LogWarn(string msg) {
    log:printWarn(msg);
}
