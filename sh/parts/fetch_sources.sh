#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

CONFIG_FILE="$1"

while read -r name url; do
    echo "Downloading ${name} ..."
    wget -q --show-progress --retry-connrefused --timeout=10 -c "$url" -O "$name"
done < "$CONFIG_FILE"
