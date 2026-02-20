#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Sanitizing filter syntax in: $file"

    # Delete comments
    sed_inplace '/^#/d' "$file"

    # Remove quotation marks and whitespace
    sed_inplace 's/"//g' "$file"
    sed_inplace 's/^[[:space:]]*//;s/[[:space:]]*$//' "$file"
    sed_inplace 's/[[:space:]]\+/ /g' "$file"

    # Add || at the beginning and ^ at the end, if missing
    sed_inplace 's/$/^/' "$file"
    sed_inplace 's/^/||/' "$file"
done
