#!/usr/bin/env bash

source $(dirname $0)/request.sh

# No custom message, no default value
echo "Output: (no default value) [] ?" 
echo "Value: "
myVar1=$(request)
echo "$myVar1"

# Custom message, no default value
echo "Please, enter a value (no default value) [] ?"
echo "Value: "
myVar2=$(request "Please, enter a value")
echo "$myVar2"

# No custom message,  default value
echo " [Default Value] ?"
echo "Value: Default Value"
myVar3=$(request "" "Default Value")
echo "$myVar3"

# Cstom message,  default value
echo "Please, enter a value [Default Value] ?"
echo "Value: Default Value"
myVar4=$(request "Please, enter a value" "Default Value")
echo "$myVar4"