#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

for file in "$@"; do
    [[ ! -f "$file" ]] && continue
    echo "Formatting: $file"

    # Cleaning blank lines
    sed -i '/^$/d' "$file"

    # NSA header removal if applicable
    if [[ "$file" == *"NSA-CIA-Blocklist"* ]]; then
        sed -i -e '1,16d' "$file"
        head -n -2 "$file" > tmp && mv tmp "$file"
        sed -i 's/^........//' "$file"
    fi

    # Phishing DB header removal if applicable
    if [[ "$file" == *"phishingdomains.txt" ]]; then
        sed -i -e '1,3d' "$file"
    fi
done
