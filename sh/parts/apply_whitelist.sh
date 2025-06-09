#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Applying whitelist..."

cp "contrib/siteblock_contrib" "hws_contrib.txt"
[[ -f "contrib/upd_exclude" ]] && sort -u "contrib/upd_exclude" -o "whitelist_sort.txt" || touch "whitelist_sort.txt"

while read -r line; do
    [[ -z "$line" ]] && continue  # salta righe vuote
    echo "Deleting: $line"
    
    # Escape per sed (rende sicuri i caratteri speciali)
    safe_line=$(printf '%s\n' "$line" | sed 's/[][\/.^$*]/\\&/g')

    for file in "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt"; do
        [[ -f "$file" ]] || continue  # salta se il file non esiste
        sed -i "/$safe_line/d" "$file"
    done
done < "whitelist_sort.txt"
