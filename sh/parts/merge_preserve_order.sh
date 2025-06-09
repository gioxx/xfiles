#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

OUTPUT="$1"       # example: experimental.txt
VCHECK="$2"       # example: vcheck/check_experimental.txt
shift 2
INPUT_FILES=("$@")

echo "Merging files in original order (no sorting or dedup)..."

rm -f "$OUTPUT" tmp_merge.txt

for f in "${INPUT_FILES[@]}"; do
    [[ -f "$f" ]] && cat "$f" >> tmp_merge.txt
done

cp tmp_merge.txt "$OUTPUT"
rm -f tmp_merge.txt

# MD5 + ENV
echo "stop=false" >> "$GITHUB_ENV"
md5_new=$(md5sum "$OUTPUT" | cut -d ' ' -f 1)
md5_old=$(sed -n '5p' "$VCHECK" 2>/dev/null || echo "")

echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"

if [[ "$md5_new" == "$md5_old" ]]; then
  echo "stop=true" >> "$GITHUB_ENV"
else
  echo "md5=$md5_new" >> "$GITHUB_ENV"
fi
