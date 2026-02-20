#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

sed_inplace() {
    if sed --version >/dev/null 2>&1; then
        sed -i "$@"
    else
        sed -i '' "$@"
    fi
}
