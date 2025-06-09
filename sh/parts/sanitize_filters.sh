#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Sanitizing filter syntax in: $file"

    # Remove leading/trailing quotes and whitespace
    sed -i 's/^"//; s/"$//' "$file"                         # removes quotation marks
    sed -i 's/^[[:space:]]*//; s/[[:space:]]*$//' "$file"   # spaces / tabs

    # Also clean up common malformed entries
    sed -i 's/||http:/||https?:/g' "$file"  # if useful (avoids duplication)
done
