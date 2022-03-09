#!/usr/bin/env bash

# Docs and reference
# Credit: Drew Stokes, https://medium.com/@Drew_Stokes/bash-argument-parsing-54f3b81a6a8f
# Explanation of ${2:0:1}, https://unix.stackexchange.com/a/275651 by heemayl
# Explanation of "-n": Check if the length of a string is nonzero

parse_cli_args() {
    PARAMS=""

    while (( "$#" ))
    do
        case "$1" in
            -a|--bool-flag)
                BOOL_FLAG=0
                shift
                ;;
            -b|--key-value-arg)
                if [ -n "$2" ] && [ "${2:0:1}" != "-" ]
                then
                    MY_KEY_VALUE_ARG="$2"
                    shift 2
                else
                    echo "Error: Argument for $1 is missing" >&2
                    exit 1
                fi
                ;;
            -*|--*=) # Unsupported flags
                echo "Error: Unsupported flag $1" >&2
                exit 1
                ;;
            *) # Preserve positional arguments
                PARAMS="$PARAMS $1"
                shift
                ;;
        esac
    done

    # Set positional arguments in their proper place
    eval set -- "$PARAMS"
}

parse_cli_args "$@"
