#!/bin/bash
set -e

echo "Formatting blocklist sources ..."

# Rimuove header e spazi inutili
sed -i -e '1,3d' "hws_contrib.txt"
sed -i -e '1,16d' "NSA-CIA-Blocklist.txt"
sed -i '/^$/d' "hws_contrib.txt"
head -n -2 "NSA-CIA-Blocklist.txt" > tmp && mv tmp "NSA-CIA-Blocklist.txt"
sed -i 's/^........//' "NSA-CIA-Blocklist.txt"

# Applica trim spazi + formattazione
for file in "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" "hws_contrib.txt"; do
    sed -i 's/^[ \t]*//;s/[ \t]*$//' "$file"
    sed -i -e 's/^/||/' -e 's/$/^/' "$file"
    sed -i 's/||[ \t]*/||/g' "$file"
done
