giorno=$(date +%d)
mese=$(date +%m)
anno=$(date +%Y)
ora=$(date +%H)
minuto=$(date +%M)
echo "update=$anno$mese$giorno$ora$minuto" >> $GITHUB_ENV
echo "lastmodified=$giorno"-"$mese"-"$anno" >> $GITHUB_ENV
