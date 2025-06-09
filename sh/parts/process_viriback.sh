#!/bin/bash
set -e

echo "Processing Viriback CSV ..."
wget -q -O viriback.csv "https://tracker.viriback.com/dump.php"
tail -n +2 viriback.csv | cut -d',' -f2 \
  | sed -e 's/^/||/' -e 's/$/^/' > viriback_list.txt
