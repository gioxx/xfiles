#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

bash ./sh/parts/fetch_sources.sh ./sh/config/sources_hws.conf
bash ./sh/parts/check_files.sh 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
bash ./sh/parts/process_urlhaus.sh
bash ./sh/parts/process_viriback.sh

cp "contrib/siteblock_contrib" "hws_contrib.txt"

bash ./sh/parts/apply_whitelist.sh 2021-07-18_nso.txt NSA-CIA-Blocklist.txt hws_contrib.txt
bash ./sh/parts/format_files.sh 2021-07-18_nso.txt NSA-CIA-Blocklist.txt hws_contrib.txt
bash ./sh/parts/sanitize_filters.sh 2021-07-18_nso.txt NSA-CIA-Blocklist.txt hws_contrib.txt urlhaus_list.txt viriback_list.txt
bash ./sh/parts/merge_and_finalize.sh siteblock.txt vcheck/check_siteblock.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt hws_contrib.txt urlhaus_list.txt viriback_list.txt
