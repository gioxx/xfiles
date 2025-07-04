#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

cp contrib/xfiles_* ./ && rm -f ./xfiles_20-sperimentali

for f in xfiles_*; do
  cat "$f" >> filtri_tmp.txt
done

echo "stop=false" >> "$GITHUB_ENV"
md5_new=$(md5sum filtri_tmp.txt | cut -d ' ' -f 1)
md5_old=$(sed -n '5p' vcheck/check_filtri.txt)

echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"

if [[ "$md5_new" == "$md5_old" ]]; then
  echo "stop=true" >> "$GITHUB_ENV"
  echo "Same MD5, skip list creation."
else
  echo "Different MD5, proceed with list creation."
  echo "md5=$md5_new" >> "$GITHUB_ENV"
  cat filtri_tmp.txt > filtri.txt
  rm -f filtri_tmp.txt xfiles_*
fi
