#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

source "$(dirname "$0")/lib/xfiles_section_header.sh"

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

cp contrib/xfiles_* ./ && rm -f ./xfiles_20-sperimentali

: > filtri_tmp.txt
for f in xfiles_*; do
  [[ -f "$f" ]] || continue
  append_xfiles_section filtri_tmp.txt "$f"
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
