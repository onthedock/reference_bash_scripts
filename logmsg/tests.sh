#!/usr/bin/env bash

source $(dirname $0)/logmsg.sh

logConfig --log-level 2 --make-temp-dir # --log-name "mylog.log"

log "it's working"
log "information: it works" INFO
log "don't know what it is" PEPE
log "it's not working :(" ERROR
log "uhm, probably it's nothing to worry about" WARN
log "need everything you've got" DEBUG