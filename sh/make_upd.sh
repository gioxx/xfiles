wget -c "https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains/output/domains/ACTIVE/list" -O "phishingdomains.txt"
wget -c "https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/domains.txt" -O "2021-07-18_nso.txt"
wget -c "https://raw.githubusercontent.com/tigthor/NSA-CIA-Blocklist/main/HOSTS/HOSTS" -O "NSA-CIA-Blocklist.txt"
wget -c "https://github.com/mitchellkrogza/Phishing.Database/raw/master/whitelist.me/whitelist.me" -O "whitelist.txt"

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
emptycheck "2021-07-18_nso.txt"
emptycheck "NSA-CIA-Blocklist.txt"
test -s "whitelist.txt" || exit 1
grep -v -P '^(REG|ALL)' whitelist.txt | sort  >> contrib/upd_exclude

while read line; do
  echo "Cerco ed elimino $line"
  sed -e "/$line/d" -i "phishingdomains.txt"
	sed -e "/$line/d" -i "2021-07-18_nso.txt"
	sed -e "/$line/d" -i "NSA-CIA-Blocklist.txt"
done < contrib/upd_exclude

#	Remove header and blank lines from 3rd-party lists
#	Credits:	https://unix.stackexchange.com/questions/37790/how-do-i-delete-the-first-n-lines-of-an-ascii-file-using-shell-commands
#           https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/
sed -i -e 1,3d "phishingdomains.txt"
sed -i -e 1,16d "NSA-CIA-Blocklist.txt"
sed -i '/^$/d' "phishingdomains.txt"

#	Remove "0.0.0.0" (from each line) and latest two lines from NSA-CIA-Blocklist
#	Credits:	https://stackoverflow.com/a/13380679/2220346
#           https://www.baeldung.com/linux/remove-last-n-lines-of-file
#				    https://stackoverflow.com/a/3806107/2220346
head -n -2 "NSA-CIA-Blocklist.txt" > "NSA-CIA-Blocklist_tmp.txt" && mv "NSA-CIA-Blocklist_tmp.txt" "NSA-CIA-Blocklist.txt"
sed -e 's/^........//' -i "NSA-CIA-Blocklist.txt"

#	Prepend "||" and append "^" for each line
#	Credits:	https://stackoverflow.com/questions/2869669/in-bash-how-do-i-add-a-string-after-each-line-in-a-file
sed -e 's/$/^/' -i "phishingdomains.txt"
sed -e 's/$/^/' -i "2021-07-18_nso.txt"
sed -e 's/$/^/' -i "NSA-CIA-Blocklist.txt"
sed -e 's/^/||/' -i "phishingdomains.txt"
sed -e 's/^/||/' -i "2021-07-18_nso.txt"
sed -e 's/^/||/' -i "NSA-CIA-Blocklist.txt"

cat "phishingdomains.txt" "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" >> "upd_nosort.txt"
sort -o "upd_sort.txt" "upd_nosort.txt"
uniq "upd_sort.txt" "upd_sort_tmp.txt" && mv "upd_sort_tmp.txt" "upd_sort.txt"
cat "upd_sort.txt" >> "upd.txt"
rm "phishingdomains.txt" "2021-07-18_nso.txt" "NSA-CIA-Blocklist.txt" "upd_nosort.txt" "upd_sort.txt" whitelist.txt
