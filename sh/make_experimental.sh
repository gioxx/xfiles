#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

bash ./sh/parts/check_files.sh contrib/xfiles_*
cp contrib/xfiles_* ./
bash ./sh/parts/merge_and_finalize.sh experimental.txt vcheck/check_experimental.txt xfiles_*

if grep -q '^stop=true' "$GITHUB_ENV"; then
  echo "No update needed, skipping header prepend."
else
  bash ./sh/parts/prepend_header.sh experimental.txt "! [NoAds X Files - Filtri per blocco Paywall (sperimentale)]"
fi
