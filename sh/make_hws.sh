#!/bin/bash

# Array of files and URLs
declare -A files=(
    ["blackbook.txt"]="https://raw.githubusercontent.com/stamparm/blackbook/master/blackbook.txt"
    ["2021-07-18_nso.txt"]="https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/domains.txt"
    ["NSA-CIA-Blocklist.txt"]="https://raw.githubusercontent.com/noads-it/NSA-CIA-Blocklist/main/HOSTS/HOSTS"
)

# Download files
for file in "${!files[@]}"; do
    echo "Downloading ${file} ..."
    wget -q --show-progress --retry-connrefused --timeout=10 -c "${files[$file]}" -O "$file"
    if [[ ! -s "$file" ]]; then
        echo "Error: $file empty or not downloaded correctly!"
        exit 1
    fi
done

cp "contrib/siteblock_contrib" "hws_contrib.txt"

if [[ -f "contrib/upd_exclude" ]]; then
    sort -u "contrib/upd_exclude" -o "whitelist_sort.txt"
else
    touch "whitelist_sort.txt"
fi

# Removes whitelist domains from files
while read -r line; do
    echo "Deleting: $line"
    for file in "${!files[@]}"; do
        sed -i "/$line/d" "$file"
    done
done < "whitelist_sort.txt"

# Cleaning headers and blank lines
sed -i -e '1,3d' "hws_contrib.txt"
sed -i -e '1,16d' "NSA-CIA-Blocklist.txt"
sed -i '/^$/d' "blackbook.txt" "hws_contrib.txt"

# Removes "0.0.0.0" at the beginning of the lines and the last 2 lines from the NSA-CIA-Blocklist
head -n -2 "NSA-CIA-Blocklist.txt" > "NSA-CIA-Blocklist_tmp.txt" && mv "NSA-CIA-Blocklist_tmp.txt" "NSA-CIA-Blocklist.txt"
sed -i 's/^........//' "NSA-CIA-Blocklist.txt"

# Adds prefixes and suffixes to domains
for file in "${!files[@]}" "hws_contrib.txt"; do
    sed -i -e 's/^/||/' -e 's/$/^/' "$file"
done

# Merges all files, sorts and removes duplicates, cleans up initial, final, and multiple spaces
cat "${!files[@]}" "hws_contrib.txt" > "siteblock_nosort.txt"
sort -u "siteblock_nosort.txt" -o "siteblock_sort.txt"
sed -i 's/^[ \t]*//;s/[ \t]*$//;s/[ \t]\+/ /g' "siteblock_sort.txt"

# MD5 check to verify changes
echo "stop=false" >> "$GITHUB_ENV"
md5_new=$(md5sum siteblock_sort.txt | cut -d ' ' -f 1)
md5_old=$(sed -n '5p' vcheck/check_siteblock.txt)

echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"

if [[ "$md5_new" == "$md5_old" ]]; then
    echo "stop=true" >> "$GITHUB_ENV"
    echo "No changes detected, process finished."
else
    echo "Updated list, creating siteblock.txt"
    echo "md5=$md5_new" >> "$GITHUB_ENV"
    cp "siteblock_sort.txt" "siteblock.txt"
    rm -f "${!files[@]}" "hws_contrib.txt" "siteblock_nosort.txt" "siteblock_sort.txt" "whitelist_sort.txt"
fi
