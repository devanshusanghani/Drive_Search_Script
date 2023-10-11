#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: drive_search.sh <operation_type> <key_information_type>"
    echo "operation_type: 0-search, 1-extraction"
    echo "key_information_type: phone, url, email, ip, username"
    exit 1
fi

operation=$1
key_info=$2

# Define the regex patterns for different key information types
declare -A regex_patterns
regex_patterns[phone]='(\()?\b[0-9]{3}(?(1)\)[. -]?|[. -]?)[0-9]{3}[. -]?[0-9]{4}\b'
regex_patterns[url]='http://www\..+\.[a-z]{3,4}'
regex_patterns[email]='[a-zA-Z0-9.-]{2,15}@[a-zA-Z0-9]{1,15}\.[a-zA-Z0-9]{3,4}'
regex_patterns[ip]='([0-9]{1,3}\.){3}[0-9]{1,3}'
regex_patterns[username]='^[A-Z][^,]*, [^,]*'

# Perform the search or extraction based on the specified operation type and key information type
case $operation in
    0) # Search
        if [ "$key_info" == "phone" ]; then
            grep -P "${regex_patterns[$key_info]}" ./*
        else
            grep -E "${regex_patterns[$key_info]}" ./*
        fi
        ;;
    1) # Extraction
        if [ "$key_info" == "phone" ]; then
            cat ./* | strings | grep -P "${regex_patterns[$key_info]}"
        else
            cat ./* | strings | grep -E "${regex_patterns[$key_info]}"
        fi
        ;;
    *)
        echo "Invalid operation type. Choose 0 for search or 1 for extraction."
        exit 1
        ;;
esac


exit 0
