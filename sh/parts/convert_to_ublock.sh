#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Converting entries to uBlock format in: $file"

    # Skip already formatted files
    if grep -q '^||' "$file"; then
        echo "Skipped: $file already seems formatted."
        continue
    fi

    # Add || at start, ^ at end
    sed -i 's/$/^/' "$file"
    sed -i 's/^/||/' "$file"
done
