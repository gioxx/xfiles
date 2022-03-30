# Come contribuire direttamente?

All'interno di questa cartella si trovano tutti i singoli file che permettono la costruzione delle liste filtri **X Files**, **NoFacebookAds** (NFA), **Harmful WebSites** (HWS) e **uBlock Phishing Domains** (UPD).

* [X Files (modulo principale)](#x-files--modulo-principale-)
  + [Basi dati specifiche](#basi-dati-specifiche)
* [NoFacebookAds (NFA)](#nofacebookads--nfa-)
* [Harmful WebSites & uBlock Phishing Domains (HWS, UPD)](#harmful-websites---ublock-phishing-domains--hws--upd-)
  + [Eccezioni](#eccezioni)

## X Files (modulo principale)

Se vuoi includere un nuovo filtro all'interno del modulo principale di **X Files** puoi:

- [creare una nuova issue](https://github.com/gioxx/xfiles/issues/new/choose) e descrivermi il problema così da poterlo analizzare e creare eventualmente filtri ad-hoc.
- Inserirlo tu stesso nella lista [xfiles_contrib](/xfiles_contrib), che contiene gli elementi proposti dagli utilizzatori di lista che non sono ancora stati catalogati nelle basi dati specifiche.

### Basi dati specifiche

Contengono i filtri in maniera più ordinata, raccolti per specifico scopo. Collaborare attivamente allo sviluppo di queste basi dati vuol dire mettere mano ai singoli file (che vengono poi usati per modellare la lista X Files principale) e:

- [xfiles_00-whitelist](/contrib/xfiles_00-whitelist): aggiungere un elemento / dominio da ignorare completamente.
- [xfiles_01-adsnoninvasivi]( /contrib/xfiles_01-adsnoninvasivi ): aggiungere un elemento / dominio alle esclusioni della lista, utile per quei siti web che non propongono elementi pubblicitari invasivi e utilizzano metodi di protezione da Adblocker per evitare che l'utente riesca a visitarli.
- [xfiles_10-rootdomains]( /contrib/xfiles_10-rootdomains ): aggiungere un dominio specifico utilizzato per il caricamento di risorse pubblicitarie. Da qualche anno a questa parte è più difficile inserirne di nuovi ma è una buona base storica alla quale fare affidamento.
- [xfiles_11-specifici]( /contrib/xfiles_11-specifici ): aggiungere specifici elementi di domini da bloccare. È la base dati certamente più modificata (da diverso tempo a questa parte).
- [xfiles_12-elementibloccati]( /contrib/xfiles_12-elementibloccati): aggiungere specifici elementi di domini terze parti (e non solo) da bloccare. Utile nel caso in cui i domini visitati vadano a caricare risorse da un sito web esterno, popup, ecc.
- [xfiles_13-elementinascosti]( /contrib/xfiles_13-elementinascosti): aggiungere modifiche estetiche. Utile nel caso in cui alcuni domini propongano importanti spazi vuoti dopo aver bloccato fonti pubblicitarie (ma non solo).
- [xfiles_14-ublockscripts]( /contrib/xfiles_14-ublockscripts): aggiungere filtri inline compatibili con uBlock, che permettono quindi di bloccare determinate richieste dei siti web (come i check per l'uso di Adblocker, per esempio).
- [xfiles_15-youtube]( /contrib/xfiles_15-youtube): aggiungere / modificare filtri pensati e utili specificatamente all'uso pulito di YouTube.
- [xfiles_20-sperimentali]( /contrib/xfiles_20-sperimentali): aggiungere filtri da testare prima del rilascio della versione stabile del modulo X Files principale (ne fa quindi largo uso la lista "[eXperimental](https://github.com/gioxx/xfiles/blob/master/experimental.txt)").
- [xfiles_21-idcac]( /contrib/xfiles_21-idcac): aggiungere filtri in grado di bloccare gli avvisi di accettazione Cookie contenuti nei domini visitati. È una base dati ancora giovane e sperimentale, in continua evoluzione.
- [xfiles_22-bpc]( /contrib/xfiles_22-bpc): un nuovo esperimento portato a bordo di X Files. Si tratta dei filtri di blocco paywall resi pubblici da [Bypass Paywalls Clean](https://gitlab.com/magnolia1234/bypass-paywalls-clean-filters) e disponibili pubblicamente nel [repository GitLab](https://gitlab.com/magnolia1234/bypass-paywalls-clean-filters/-/blob/main/bpc-paywall-filter.txt), dedicati a chi non vuole usare ulteriori estensioni sul proprio browser ma riscontra difficoltà nell'accedere alcuni contenuti online.
- [xfiles_30-abusorisorse]( /contrib/xfiles_30-abusorisorse): aggiungere filtri che impediscono a elementi contenuti nei domini di fare abuso di risorse del PC che li sta navigando, ne parlavo nell'articolo https://gioxx.org/2018/02/27/nocoin-il-cryptojacking-e-ormai-argomento-comune (sono filtri integrati direttamente in X Files da quando ho dismesso il modulo **NoCoin**).

La lista [xfiles_99-dismissione]( /contrib/xfiles_99-dismissione) è chiaramente una raccolta di filtri che verranno presto dismessi dalla lista principale durante una revisione futura della stessa, poiché non più utili (duplicati, fonti ormai non più attive, ecc.).

## NoFacebookAds (NFA)

Se vuoi includere un nuovo filtro all'interno del modulo **NoFacebookAds** puoi:

- [creare una nuova issue](https://github.com/gioxx/xfiles/issues/new/choose) e descrivermi il problema così da poterlo analizzare e creare eventualmente filtri ad-hoc.
- Inserirlo tu stesso nella lista [nfa](/nfa), che contiene gli elementi scritti da me o proposti dagli utilizzatori del modulo.

## Harmful WebSites & uBlock Phishing Domains (HWS, UPD)

Se vuoi includere un nuovo filtro all'interno dei moduli **Harmful WebSites** e/o **uBlock Phishing Domains** puoi:

- [creare una nuova issue](https://github.com/gioxx/xfiles/issues/new/choose) e descrivermi il problema così da poterlo analizzare e creare eventualmente filtri ad-hoc.
- Inserirlo tu stesso nella lista [siteblock_contrib](/siteblock_contrib), che contiene gli elementi scritti da me o proposti dagli utilizzatori dei due moduli.

### Eccezioni

Dato che possono esistere casi di falso positivo all'interno delle liste HWS / UPD, è stata creata una base dati ad-hoc che permette di elencare una serie di domini da ripulire da ambo le liste prima dei rilasci ufficiali, [upd_exclude](/upd_exclude).
