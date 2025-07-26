#!/usr/bin/env bash

trim_space() {
    # trim_space removes one or more spaces at the beginning or the end of '$1'
    # It also replaces multiple spaces with just one in any position.
    # If the second argument is '--lowercase', it also converts the value to lowercase
    # E.g: '  My   Workspace Display Name  has    Spaces   ' -> 'My Workspace Display Name has Spaces'
    local trimmed
    trimmed=$(echo "$1" | sed -r 's/^[[:blank:]]+//g' | sed -r 's/$[[:blank:]]+//g' | tr -s '[:space:]' | tr -d '\n\r')
    [[ "${2//-}" == "lowercase" ]] && trimmed="${trimmed,,}"
    echo "$trimmed"
}
