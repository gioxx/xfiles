#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Processing Viriback CSV ..."
wget -q -O viriback.csv "https://tracker.viriback.com/dump.php"
tail -n +2 viriback.csv | cut -d',' -f2 \
  | sed -e 's/^/||/' -e 's/$/^/' > viriback_list.txt
