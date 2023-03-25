wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-ACTIVE.txt" -O "do_phishingdomains.txt"
wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-NEW-today.txt" -O "do_phishingdomains_newtoday.txt"
wget -c "https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/domains.txt" -O "do_2021-07-18_nso.txt"
wget -c "https://raw.githubusercontent.com/noads-it/NSA-CIA-Blocklist/main/HOSTS/HOSTS" -O "do_NSA-CIA-Blocklist.txt"
wget -c "https://raw.githubusercontent.com/marco-acorte/antispam-it/main/antispam-it.txt" -O "do_antispam-it.txt"
wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/whitelist.me/whitelist.me" -O "do_whitelist.me"

emptycheck () {
  if [ -s $1 ]
  then
    echo "$1 is not empty, go forward!"
  else
    echo "$1 is empty, stop UPD creation process."
    exit
  fi
}

emptycheck "do_phishingdomains.txt"
emptycheck "do_phishingdomains_newtoday.txt"
emptycheck "do_2021-07-18_nso.txt"
emptycheck "do_NSA-CIA-Blocklist.txt"
emptycheck "do_antispam-it.txt"
test -s "do_whitelist.me" || exit 1
grep -v -P '^(REG|ALL)' do_whitelist.me | sort >> do_whitelist.txt
rm "do_whitelist.me"

cat contrib/upd_exclude >> "do_whitelist.txt"
sort -u -o "do_whitelist_sort.txt" "do_whitelist.txt"
rm "do_whitelist.txt"
while read line; do
  echo "Cerco ed elimino $line"
  sed -e "/$line/d" -i "do_phishingdomains.txt"
  sed -e "/$line/d" -i "do_phishingdomains_newtoday.txt"
  sed -e "/$line/d" -i "do_2021-07-18_nso.txt"
  sed -e "/$line/d" -i "do_NSA-CIA-Blocklist.txt"
  sed -e "/$line/d" -i "do_antispam-it.txt"
done < do_whitelist_sort.txt

sed -i -e 1,16d "do_NSA-CIA-Blocklist.txt"
sed -i '/^$/d' "do_phishingdomains.txt"
sed -i '/^$/d' "do_phishingdomains_newtoday.txt"
sed -i '/^$/d' "do_antispam-it.txt"
head -n -2 "do_NSA-CIA-Blocklist.txt" > "do_NSA-CIA-Blocklist_tmp.txt" && mv "do_NSA-CIA-Blocklist_tmp.txt" "do_NSA-CIA-Blocklist.txt"
sed -e 's/^........//' -i "do_NSA-CIA-Blocklist.txt"

# Collect filters
cat "do_phishingdomains.txt" "do_phishingdomains_newtoday.txt" "do_2021-07-18_nso.txt" "do_NSA-CIA-Blocklist.txt" "do_antispam-it.txt" >> "do_upd_nosort.txt"
sort -o "do_upd_sort.txt" "do_upd_nosort.txt"
uniq "do_upd_sort.txt" "do_upd_sort_tmp.txt" && mv "do_upd_sort_tmp.txt" "do_upd_sort.txt"

# MD5 check and populate Domains
echo "stop=false" >> $GITHUB_ENV
md5_new=$(md5sum do_upd_sort.txt| cut -d ' ' -f 1)
md5_old=$(sed -n '5p' vcheck/check_domains.txt)
echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"
if [ "$md5_new" = "$md5_old" ]; then
		echo "stop=true" >> $GITHUB_ENV
    echo "Same MD5, skip list creation."
else
    echo "Different MD5, proceed with list creation."
		echo "md5=$md5_new" >> $GITHUB_ENV
    cat "do_upd_sort.txt" > "domains/upd_domains.txt"
    rm "do_phishingdomains.txt" "do_phishingdomains_newtoday.txt" "do_2021-07-18_nso.txt" "do_NSA-CIA-Blocklist.txt" "do_upd_nosort.txt" "do_upd_sort.txt" "do_whitelist_sort.txt" "do_antispam-it.txt"
fi
