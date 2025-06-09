#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Sanitizing filter syntax in: $file"

    sed -i '/^#/d' "$file"

    sed -i 's/"//g' "$file"
    sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//' "$file"
    sed -i 's/[[:space:]]\+/ /g' "$file"

    sed -i 's/$/^/' "$file"
    sed -i 's/^/||/' "$file"
done

