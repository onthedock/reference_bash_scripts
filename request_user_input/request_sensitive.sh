#!/usr/bin/env bash

# request_sensitive "Prompt text" "defaultValue" -s|--sensitive
# With -s|--sensitive, pass the `-s` option to `read` so there is
# no echo on the terminal (useful for passwords, etc)

function parse_cli_args () {
    PARAMS=()

    while (( "$#" ))
    do
        case "$1" in
            -s|--sensitive)
                SENSITIVE="yes"
                shift
                ;;
            -*|--*=) # Unsupported flags
                echo "Error: Unsupported flag $1" >&2
                exit 1
                ;;
            *) # Preserve positional arguments
                PARAMS+=("$1")
                shift
                ;;
        esac
    done

    # Set positional arguments in their proper place
    eval set -- "$PARAMS"
}

function request () {
    parse_cli_args "$@"

    msg=${PARAMS[0]}

    if [ ${#PARAMS[@]} -lt 2 ]
    then
        msg+=" (No default value)"
    else
        defaultValue="${PARAMS[1]}"
        msg+=" (default: ${defaultValue})"
    fi

    if [ "${SENSITIVE}" == "yes" ]
    then
        read -s -p "$msg : " userinput
    else
        read -p "$msg : " userinput
    fi

    if [ -z "${userinput}" ]
    then
        userinput=$defaultValue
    fi

    echo ${userinput}
}