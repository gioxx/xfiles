#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Processing UrlHaus JSON ..."
wget -q -O urlhaus.json "https://urlhaus.abuse.ch/downloads/json_online/"
jq -r '..|objects|arrays|select(.url_status=="online")|.url' urlhaus.json \
  | sed '/^$/d' > urlhaus_list.txt
