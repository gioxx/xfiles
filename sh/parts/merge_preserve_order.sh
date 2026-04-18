#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"
source "$(dirname "$0")/../lib/xfiles_section_header.sh"

append_xfiles_section() {
    local target_file="$1"
    local source_file="$2"

    if [[ -s "$target_file" ]]; then
        local file_size last_byte_hex
        file_size=$(wc -c < "$target_file")
        last_byte_hex=$(dd if="$target_file" bs=1 count=1 skip=$((file_size - 1)) 2>/dev/null | od -An -t x1 | tr -d ' \n')
        if [[ "$last_byte_hex" != "0a" ]]; then
            printf '\n' >> "$target_file"
        fi
    fi

    emit_xfiles_section_header "$source_file" >> "$target_file"
}

OUTPUT="$1"       # example: experimental.txt
VCHECK="$2"       # example: vcheck/check_experimental.txt
shift 2
INPUT_FILES=("$@")

echo "Merging files in original order (no sorting or dedup)..."

rm -f "$OUTPUT" tmp_merge.txt

for f in "${INPUT_FILES[@]}"; do
    [[ -f "$f" ]] || continue
    append_xfiles_section tmp_merge.txt "$f"
    cat "$f" >> tmp_merge.txt
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
