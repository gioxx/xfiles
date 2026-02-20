#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Formatting: $file"

    # Cleaning blank lines
    sed_inplace '/^$/d' "$file"

    # NSA header removal if applicable
    if [[ "$file" == *"NSA-CIA-Blocklist"* ]]; then
        sed_inplace -e '1,16d' "$file"
        if head -n -2 "$file" > tmp 2>/dev/null; then
            mv tmp "$file"
        else
            sed '$d' "$file" | sed '$d' > tmp && mv tmp "$file"
        fi
        sed_inplace 's/^........//' "$file"
    fi

    # Phishing DB header removal if applicable
    if [[ "$file" == *"phishingdomains.txt" ]]; then
        sed_inplace -e '1,3d' "$file"
    fi
done
