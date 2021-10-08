#!/usr/bin/env bash

source ./logmsg.sh

logConfig --log-level 0 --make-temp-dir

log "it's working"
log "information: it works" INFO
log "don't know what it is" PEPE
log "it's not working :(" ERROR
log "uhm, probably it's nothing to worry about" WARN
log "need everything you've got" DEBUG