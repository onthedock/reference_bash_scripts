#!/usr/bin/env bash

source $(dirname $0)/parse_cli_args.sh

# parse_cli_args/test.sh
# BOOL_FLAG: 
# MY_KEY_VALUE_ARG: 
# PARAMS:

# parse_cli_args/test.sh -a
# BOOL_FLAG: 0
# MY_KEY_VALUE_ARG: 
# PARAMS: 

# parse_cli_args/test.sh -b
# Error: Argument for -b is missing

# parse_cli_args/test.sh -b amarillo
# BOOL_FLAG: 
# MY_KEY_VALUE_ARG: amarillo
# PARAMS: 

# parse_cli_args/test.sh 1 2 -b amarillo 3 4
# BOOL_FLAG: 
# MY_KEY_VALUE_ARG: amarillo
# PARAMS:  1 2 3 4


echo "BOOL_FLAG: $BOOL_FLAG"
echo "MY_KEY_VALUE_ARG: $MY_KEY_VALUE_ARG"
echo "PARAMS: $PARAMS"