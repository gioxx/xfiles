#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

CONFIG_FILE="$1"

while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "${line//[[:space:]]/}" ]] && continue
    [[ "$line" =~ ^[[:space:]]*# ]] && continue

    read -r name url _ <<< "$line"
    if [[ -z "${name:-}" || -z "${url:-}" ]]; then
        echo "Skipping invalid config line: $line"
        continue
    fi

    echo "Downloading ${name} ..."
    wget -q --show-progress --retry-connrefused --timeout=10 -c "$url" -O "$name"
done < "$CONFIG_FILE"
