#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Processing Viriback CSV ..."

# Download the CSV file with retries
attempts=3
success=0

for i in $(seq 1 $attempts); do
  wget -q -O viriback.csv "https://tracker.viriback.com/dump.php" && success=1 && break
  sleep 3
done

if [ $success -ne 1 ] || [ ! -s viriback.csv ]; then
  echo "Warning: viriback.csv not downloaded after $attempts or the file is empty. I continue without Viriback data."
  touch viriback_list.txt
  exit 0
fi

tail -n +2 viriback.csv | cut -d',' -f2 \
  | sed '/^$/d' > viriback_list.txt
