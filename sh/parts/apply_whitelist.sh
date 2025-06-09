#!/bin/bash
set -e

echo "Applying whitelist ..."

cp "contrib/siteblock_contrib" "hws_contrib.txt"
[[ -f "contrib/upd_exclude" ]] && sort -u "contrib/upd_exclude" -o "whitelist_sort.txt" || touch "whitelist_sort.txt"

while read -r line; do
    echo "Deleting: $line"
    for file in "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt"; do
        sed -i "/$line/d" "$file"
    done
done < "whitelist_sort.txt"
