#!/bin/bash
set -e

echo "Merging lists and finalizing ..."

cat "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" "hws_contrib.txt" urlhaus_list.txt viriback_list.txt > siteblock_nosort.txt
sort -u siteblock_nosort.txt -o siteblock_sort.txt

# Cleanup spacing
sed -i 's/||[ \t]*/||/g' siteblock_sort.txt
sed -i 's/[ \t]*\^/\^/g' siteblock_sort.txt

# MD5 logic
echo "stop=false" >> "$GITHUB_ENV"
md5_new=$(md5sum siteblock_sort.txt | cut -d ' ' -f 1)
md5_old=$(sed -n '5p' vcheck/check_siteblock.txt)

echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"

if [[ "$md5_new" == "$md5_old" ]]; then
    echo "stop=true" >> "$GITHUB_ENV"
    echo "No changes detected"
else
    cp siteblock_sort.txt siteblock.txt
    echo "md5=$md5_new" >> "$GITHUB_ENV"
    rm -f 2021-07-18_nso.txt NSA-CIA-Blocklist.txt hws_contrib.txt \
          urlhaus.* viriback.* siteblock_nosort.txt siteblock_sort.txt whitelist_sort.txt
fi
