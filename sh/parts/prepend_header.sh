#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

FILE="$1"
HEADER="$2"

[[ -f "$FILE" ]] || { echo "$FILE not found"; exit 1; }

echo "Prepending header to $FILE"
(echo "$HEADER" && cat "$FILE") > "${FILE}_tmp" && mv "${FILE}_tmp" "$FILE"
