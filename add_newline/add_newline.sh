#!/usr/bin/env bash

add_newline() {
    # add_newline checks the file for a newline character at the end of the file and appends it to the file if it's not present.
    # In the UNIX/Linux world, a text file is defined as a sequence of lines, each ending with a newline character (\n).
    # Without a newline, the last line is considered incomplete.
    # Many tools and scripts expect this convention, and omitting it can lead to unexpected behavior or errors.
    local filename
    filename="${1}"
    filename=${filename:?Cannot be empty}
    if [[ ! -s $filename ]]; then echo "'$filename' cannot be an empty file'" >&2; exit 1; fi
    if [[ -n "$(tail -c 1 <"$filename")" ]]; then
        cp "$filename" "${filename}.bkp"    # backup original file (just in case) 
        printf "\n" >> "$filename"
    fi
}
