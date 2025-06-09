#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Sanitizing filter syntax in: $file"

    # Delete comments
    sed -i '/^#/d' "$file"

    # Remove quotation marks and whitespace
    sed -i 's/"//g' "$file"
    sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//' "$file"
    sed -i 's/[[:space:]]\+/ /g' "$file"

    # Add || at the beginning and ^ at the end, if missing
    sed -i 's/$/^/' "$file"
    sed -i 's/^/||/' "$file"
done
