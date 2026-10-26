#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

echo "Processing UrlHaus CSV ..."
# abuse.ch retired keyless downloads (410): Auth-Key goes in the URL path
wget -q -O urlhaus.csv "https://urlhaus-api.abuse.ch/v2/files/exports/${URLHAUS_AUTH_KEY}/online.csv"
# columns: "id","dateadded","url","url_status",...
grep -v '^#' urlhaus.csv | awk -F'","' '$4=="online"{print $3}' \
  | sed '/^$/d' > urlhaus_list.txt
