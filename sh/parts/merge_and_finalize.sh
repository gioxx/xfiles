#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

OUTPUT="$1"       # example: domains/upd_domains.txt
VCHECK="$2"       # example: vcheck/check_domains.txt
shift 2
INPUT_FILES=("$@")
TMP_NOSORT="tmp_nosort.txt"
TMP_SORT="tmp_sort.txt"

cleanup_tmp() {
    rm -f "$TMP_NOSORT" "$TMP_SORT" whitelist_sort.txt
}
trap cleanup_tmp EXIT

echo "stop=false" >> "$GITHUB_ENV"

cat "${INPUT_FILES[@]}" > "$TMP_NOSORT"
sort -u "$TMP_NOSORT" -o "$TMP_SORT"

md5_new=$(md5sum "$TMP_SORT" | cut -d ' ' -f 1)
md5_old=$(sed -n '5p' "$VCHECK" 2>/dev/null || echo "NONE")

echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"

if [[ "$md5_new" == "$md5_old" ]]; then
    echo "stop=true" >> "$GITHUB_ENV"
    echo "Same MD5, skipping update"
else
    echo "md5=$md5_new" >> "$GITHUB_ENV"
    cp "$TMP_SORT" "$OUTPUT"
    echo "Output written to $OUTPUT"
    rm -f "${INPUT_FILES[@]}"
fi
