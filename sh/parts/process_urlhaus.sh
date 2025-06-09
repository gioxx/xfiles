#!/bin/bash
set -e

echo "Processing UrlHaus JSON ..."
wget -q -O urlhaus.json "https://urlhaus.abuse.ch/downloads/json_online/"
jq -r '..|objects|arrays|select(.url_status=="online")|.url' urlhaus.json \
  | sed -e 's/^/||/' -e 's/$/^/' > urlhaus_list.txt
