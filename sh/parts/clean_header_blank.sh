#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

FILE="$1"
HEADER_LINES=${2:-0}

[[ -f "$FILE" ]] || { echo "$FILE not found"; exit 1; }

echo "Cleaning file: $FILE (removing first $HEADER_LINES lines + blank lines)"
sed -i -e "1,${HEADER_LINES}d" "$FILE"
sed -i '/^$/d' "$FILE"
