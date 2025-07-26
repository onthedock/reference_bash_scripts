#!/usr/bin/env bash

errcho() {
    # errcho outputs to 'stderr', instead of 'stdout'
    echo "$@" >&2 # https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr#comment50764513_23550347
}
