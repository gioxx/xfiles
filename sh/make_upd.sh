wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-ACTIVE.txt" -O "phishingdomains.txt"
wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-NEW-today.txt" -O "phishingdomains_newtoday.txt"
wget -c "https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/domains.txt" -O "2021-07-18_nso.txt"
wget -c "https://raw.githubusercontent.com/noads-it/NSA-CIA-Blocklist/main/HOSTS/HOSTS" -O "NSA-CIA-Blocklist.txt"
# wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/whitelist.me/whitelist.me" -O "whitelist.me"

emptycheck () {
  if [ -s $1 ]
  then
    echo "$1 is not empty, go forward!"
  else
    echo "$1 is empty, stop UPD creation process."
    exit
  fi
}

emptycheck "phishingdomains.txt"
emptycheck "phishingdomains_newtoday.txt"
emptycheck "2021-07-18_nso.txt"
emptycheck "NSA-CIA-Blocklist.txt"
# test -s "whitelist.me" || exit 1
# grep -v -P '^(REG|ALL)' whitelist.me | sort >> whitelist.txt
# rm "whitelist.me"

cat contrib/upd_exclude >> "whitelist.txt"
sort -u -o "whitelist_sort.txt" "whitelist.txt"
rm "whitelist.txt"
while read line; do
  echo "Cerco ed elimino $line"
  sed -e "/$line/d" -i "phishingdomains.txt"
  sed -e "/$line/d" -i "phishingdomains_newtoday.txt"
  sed -e "/$line/d" -i "2021-07-18_nso.txt"
  sed -e "/$line/d" -i "NSA-CIA-Blocklist.txt"
done < whitelist_sort.txt

#	Remove header and blank lines from 3rd-party lists
#	Credits:	https://unix.stackexchange.com/questions/37790/how-do-i-delete-the-first-n-lines-of-an-ascii-file-using-shell-commands
#           https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/
sed -i -e 1,3d "phishingdomains.txt"
sed -i -e 1,16d "NSA-CIA-Blocklist.txt"
sed -i '/^$/d' "phishingdomains.txt"
sed -i '/^$/d' "phishingdomains_newtoday.txt"

#	Remove "0.0.0.0" (from each line) and latest two lines from NSA-CIA-Blocklist
#	Credits:	https://stackoverflow.com/a/13380679/2220346
#           https://www.baeldung.com/linux/remove-last-n-lines-of-file
#				    https://stackoverflow.com/a/3806107/2220346
head -n -2 "NSA-CIA-Blocklist.txt" > "NSA-CIA-Blocklist_tmp.txt" && mv "NSA-CIA-Blocklist_tmp.txt" "NSA-CIA-Blocklist.txt"
sed -e 's/^........//' -i "NSA-CIA-Blocklist.txt"

#	Prepend "||" and append "^" for each line
#	Credits:	https://stackoverflow.com/questions/2869669/in-bash-how-do-i-add-a-string-after-each-line-in-a-file
sed -e 's/$/^/' -i "phishingdomains.txt"
sed -e 's/$/^/' -i "phishingdomains_newtoday.txt"
sed -e 's/$/^/' -i "2021-07-18_nso.txt"
sed -e 's/$/^/' -i "NSA-CIA-Blocklist.txt"
sed -e 's/^/||/' -i "phishingdomains.txt"
sed -e 's/^/||/' -i "phishingdomains_newtoday.txt"
sed -e 's/^/||/' -i "2021-07-18_nso.txt"
sed -e 's/^/||/' -i "NSA-CIA-Blocklist.txt"

# Collect filters
cat "phishingdomains.txt" "phishingdomains_newtoday.txt" "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" >> "upd_nosort.txt"
sort -o "upd_sort.txt" "upd_nosort.txt"
uniq "upd_sort.txt" "upd_sort_tmp.txt" && mv "upd_sort_tmp.txt" "upd_sort.txt"

# MD5 check and populate UPD
echo "stop=false" >> $GITHUB_ENV
md5_new=$(md5sum do_upd_sort.txt| cut -d ' ' -f 1)
md5_old=$(sed -n '5p' vcheck/check_upd.txt)
echo "MD5 old: $md5_old"
echo "MD5 new: $md5_new"
if [ "$md5_new" = "$md5_old" ]; then
		echo "stop=true" >> $GITHUB_ENV
    echo "Same MD5, skip list creation."
else
    echo "Different MD5, proceed with list creation."
		echo "md5=$md5_new" >> $GITHUB_ENV
    cat "upd_sort.txt" >> "upd.txt"
    rm "phishingdomains.txt" "phishingdomains_newtoday.txt" "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" "upd_nosort.txt" "upd_sort.txt" "whitelist_sort.txt"
fi
