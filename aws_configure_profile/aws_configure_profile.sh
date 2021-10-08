#!/usr/bin/env bash

_bash_libs="../"
source "${_bash_libs}request_user_input/request.sh"

_aws_info (){
    echo "All values are required"
    echo -e "If the profile already exists, the script will update it\n"
}
_aws_request_config (){
    awsProfile=$(request "Enter profile name")
    awsRegion=$(request "Enter AWS Region" "eu-central-1")
    awsRoleName=$(request "Enter role name to assume")
    awsTargetAccount=$(request "Enter target AWS Account for assuming the role")
    awsSourceProfile=$(request "Enter source profile" "default")
    awsRoleSessionName=$(request "[OPTIONAL, but recommended] Enter session name (for easy auditing)" "$USER")
}

aws_configure_profile (){
    _aws_info
    # Request user's data 
    _aws_request_config

    # Configure profile
    echo "Configuring profile $awsProfile ..."
    aws configure --profile "$awsProfile" set region "$awsRegion"
    aws configure --profile "$awsProfile" set source_profile "$awsSourceProfile"
    aws configure --profile "$awsProfile" set role_arn "arn:aws:iam::$awsTargetAccount:role/$awsRoleName"
    # [Specifying a role session name for easier auditing](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-session-name)
    if [ -z "$awsRoleSessionName" ]
    then
        aws configure --profile "$awsProfile" set role_session_name "$awsRoleSessionName"
    fi
    echo "Configured profile $awsProfile."
}
