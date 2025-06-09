#!/bin/bash
source "$(dirname "$0")/../lib/error_handler.sh"

bash ./sh/parts/fetch_sources.sh
bash ./sh/parts/process_urlhaus.sh
bash ./sh/parts/process_viriback.sh
bash ./sh/parts/apply_whitelist.sh
bash ./sh/parts/format_all.sh
bash ./sh/parts/merge_and_finalize.sh
