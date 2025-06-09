#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

declare -A files=(
    ["2021-07-18_nso.txt"]="https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/domains.txt"
    ["NSA-CIA-Blocklist.txt"]="https://raw.githubusercontent.com/noads-it/NSA-CIA-Blocklist/main/HOSTS/HOSTS"
)

for file in "${!files[@]}"; do
    echo "Downloading $file ..."
    wget -q --show-progress --retry-connrefused --timeout=10 -c "${files[$file]}" -O "$file"
    [[ ! -s "$file" ]] && echo "Error: $file not downloaded!" && exit 1
done
