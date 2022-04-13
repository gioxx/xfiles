wget -c "https://gitlab.com/magnolia1234/bypass-paywalls-clean-filters/-/raw/main/bpc-paywall-filter.txt" -O "xfiles_22-bpc"

emptycheck () {
  if [ -s $1 ]
  then
    echo "$1 is not empty, go forward!"
  else
    echo "$1 is empty, stop creation process."
    exit
  fi
}
emptycheck "xfiles_22-bpc"

#	Remove header and blank lines from 3rd-party lists
#	Credits:	https://unix.stackexchange.com/questions/37790/how-do-i-delete-the-first-n-lines-of-an-ascii-file-using-shell-commands
#						https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/
sed -i -e 1,6d "xfiles_22-bpc"
sed -i '/^$/d' "xfiles_22-bpc"

# Add (first line) NoAds Section Header
# Credits:  https://unix.stackexchange.com/a/335813
(echo "! [NoAds X Files - Filtri per blocco Paywall (sperimentale)]" && cat "xfiles_22-bpc") > "xfiles_22-bpc_tmp" && mv "xfiles_22-bpc_tmp" "xfiles_22-bpc" -f

mv "xfiles_22-bpc" contrib/
cp contrib/xfiles_* ./
for f in xfiles_*; do (cat "${f}") >> experimental.txt; done
