#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Processing Viriback CSV ..."
# wget -q -O viriback.csv "https://tracker.viriback.com/dump.php"
# tail -n +2 viriback.csv | cut -d',' -f2 \
#   | sed -e 's/^/||/' -e 's/$/^/' > viriback_list.txt

# Download the CSV file with retries
attempts=3
success=0

for i in $(seq 1 $attempts); do
  wget -q -O viriback.csv "https://tracker.viriback.com/dump.php" && success=1 && break
  sleep 3
done

if [ $success -ne 1 ] || [ ! -s viriback.csv ]; then
  echo "Failed to download viriback.csv after $attempts attempts or file is empty."
  exit 1
fi

tail -n +2 viriback.csv | cut -d',' -f2 \
  | sed -e 's/^/||/' -e 's/$/^/' > viriback_list.txt