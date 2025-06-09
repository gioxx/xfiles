#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

bash ./sh/parts/check_files.sh contrib/xfiles_*
cp contrib/xfiles_* ./
bash ./sh/parts/merge_preserve_order.sh experimental.txt vcheck/check_experimental.txt xfiles_*
