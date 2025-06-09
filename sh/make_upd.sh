#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

bash ./sh/parts/fetch_sources.sh ./sh/config/sources_upd.conf
ALLOW_EMPTY=true bash ./sh/parts/check_files.sh phishingdomains.txt phishingdomains_newtoday.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
bash ./sh/parts/apply_whitelist.sh phishingdomains.txt phishingdomains_newtoday.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
bash ./sh/parts/format_files.sh phishingdomains.txt phishingdomains_newtoday.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
bash ./sh/parts/sanitize_filters.sh phishingdomains.txt phishingdomains_newtoday.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
bash ./sh/parts/merge_and_finalize.sh upd.txt vcheck/check_upd.txt phishingdomains.txt phishingdomains_newtoday.txt 2021-07-18_nso.txt NSA-CIA-Blocklist.txt
