#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

FILES=("$@")

[[ -f "contrib/upd_exclude" ]] && sort -u "contrib/upd_exclude" -o "whitelist_sort.txt" || touch "whitelist_sort.txt"

while read -r line; do
    [[ -z "$line" ]] && continue
    echo "Removing: $line"
    safe_line=$(printf '%s\n' "$line" | sed 's/[][\/.^$*]/\\&/g')

    for file in "${FILES[@]}"; do
        [[ -f "$file" ]] || continue
        sed_inplace "/$safe_line/d" "$file"
    done
done < "whitelist_sort.txt"
