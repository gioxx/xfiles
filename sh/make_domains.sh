#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO. Last command: $BASH_COMMAND"' ERR

bash ./sh/parts/fetch_sources.sh ./sh/config/sources_domains.conf
bash ./sh/parts/check_files.sh do_*.txt
bash ./sh/parts/apply_whitelist.sh do_*.txt
bash ./sh/parts/format_files.sh do_*.txt
bash ./sh/parts/merge_and_finalize.sh domains/upd_domains.txt vcheck/check_domains.txt do_*.txt
