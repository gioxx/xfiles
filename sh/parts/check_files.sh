#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

ALLOW_EMPTY=${ALLOW_EMPTY:-false}

for file in "$@"; do
    if [[ -s "$file" ]]; then
        echo "$file is not empty"
    else
        if [[ "$ALLOW_EMPTY" == "true" ]]; then
            echo "⚠️ $file is empty, but continuing anyway."
        else
            echo "$file is empty, stopping"
            exit 1
        fi
    fi
done
