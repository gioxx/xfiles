#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    if [[ -s "$file" ]]; then
        echo "$file is not empty"
    else
        echo "$file is empty, stopping"
        exit 1
    fi
done
