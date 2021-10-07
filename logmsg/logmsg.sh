#!/usr/bin/env bash

logConfig () {

    # Defaults
    logLevel=0
    logAll="true"
    mktempDir="false"

    PARAMS=""

    while (( "$#" ))
    do
        case "$1" in
            -ll|--log-level )
                if [ -n "$2" ] && [ ${2:0:1} != "-" ]
                then
                    logLevel="$2"
                    shift 2
                else
                    echo "Error: Argument for $1 is missing" >&2
                    exit 1
                fi
                ;;
            -na|--not-all-logs )
                logAll="false"
                shift
                ;;
            -mt|--make-temp-dir )
                mktempDir="true"
                shift
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

    if [ $mktempDir == "true" ]
    then
        logDir=$(mktemp -d)
    elif [ -z "$logDir" ]
    then
        logDir="."
    fi

    echo "Logging to $logDir/log.log"
}


log () {
    _severity="$2"
    
    case $_severity in
        FAIL | ERROR )
            msgLevel=-1
            ;;
        INFO )
            msgLevel=0
            ;;

        WARN )
            msgLevel=1
            ;;
        DEBUG )
            msgLevel=2
            ;;
        * | DEBUG )
            msgLevel=2
            _severity="?"
            ;;
    esac

    if [ -z "$2" ]
    then
        msgLevel=0
        _severity="INFO"
    fi

    if [ "$msgLevel" -le "$logLevel" ]
    then
        echo -e "[ $_severity ] $(date) $1" | tee -a "$logDir/log.log"
    else
        if [ "$logAll" == "true" ]
        then
            echo -e "[ $_severity ] $(date) $1 " | tee -a "$logDir/log.log" > /dev/null 
        fi
    fi
}

logConfig --make-temp-dir --log-level 0

log "it's working"
log "information: it works" INFO
log "don't know what it is" PEPE
log "it's not working :(" ERROR
log "uhm, probably it's nothing to worry about" WARN
log "need everything you've got" DEBUG