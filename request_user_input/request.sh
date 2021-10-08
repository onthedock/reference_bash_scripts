#!/usr/bin/env bash

# Ask user for input providing default values

request () {
  promptMessage="$1"

  if [ "$#" -lt 2 ]
  then
    promptMessage="$1 (no default value)"
  else
    defaultInput="$2"
  fi

  read -r -p "$promptMessage [$defaultInput] ? " userinput

  if [ -z "$userinput" ]
  then
    userinput="$defaultInput"
  fi
}

request "Message"
request "Message" "Default"
echo "$userinput"