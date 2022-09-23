# Make Stable
cp contrib/xfiles_* ./
for f in xfiles_*; do (cat "${f}") >> filtri_tmp.txt; done
cat "filtri_tmp.txt" >> "filtri.txt"
rm "filtri_tmp.txt" xfiles_*
