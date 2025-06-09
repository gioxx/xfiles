#!/bin/bash
set -e

export update="TEST"
export lastmodified="$(date -R)"
export checkwebsite="https://example.local.test"
export GITHUB_ENV="./test/github_env_mock.txt"

rm -f siteblock.txt siteblock_sort.txt siteblock_nosort.txt
rm -f urlhaus_list.txt viriback_list.txt
rm -f "$GITHUB_ENV"

bash ./sh/make_hws.sh

echo -e "\n📦 Output file: siteblock.txt"
wc -l siteblock.txt
head -n 10 siteblock.txt

echo -e "\n🔒 Variables found in GITHUB_ENV:"
cat "$GITHUB_ENV"
