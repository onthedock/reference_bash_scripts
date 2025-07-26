#!/usr/bin/env bash

get_csv_delimiter() {
    # get_csv_delimiter returns ';' or ',' if successful.
    # Raises an error and exits if $filename can't be found or it has an unknown delimiter.
    local filename
    filename="${1}"
    filename=${filename:?Cannot be empty}
    [[ -f $filename ]] || { errcho "file not found '$filename'"; exit 1; } # check that file is present
    grep -q ';' <( head -n 1 "${filename}" ) && { echo ";"; return; }
    grep -q ',' <( head -n 1 "${filename}" ) && { echo ","; return; }
    # We reach this point if the delimiter is not ';' or ','
    echo "Unknown or invalid delimiter in '$filename'" >&2 # https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr#comment50764513_23550347
    exit 1
}