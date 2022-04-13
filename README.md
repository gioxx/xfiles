NoAds X Files (xfiles.noads.it)
===================

[![ABP eXperimental Files](https://github.com/gioxx/xfiles/actions/workflows/make_experimental.yml/badge.svg)](https://github.com/gioxx/xfiles/actions/workflows/make_experimental.yml) [![ABP UPD](https://github.com/gioxx/xfiles/actions/workflows/make_upd.yml/badge.svg)](https://github.com/gioxx/xfiles/actions/workflows/make_upd.yml) [![NoAds UPD Domains Only](https://github.com/gioxx/xfiles/actions/workflows/make_domains.yml/badge.svg)](https://github.com/gioxx/xfiles/actions/workflows/make_domains.yml)

![GitHub last commit](https://img.shields.io/github/last-commit/gioxx/xfiles?color=informational) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/gioxx/xfiles?color=informational)

![Twitter Follow](https://img.shields.io/twitter/follow/gioxx?style=flat&logo=twitter) ![Twitter Follow](https://img.shields.io/twitter/follow/abpxfiles?style=flat&logo=twitter)

**[X Files](https://xfiles.noads.it)** è il nome del progetto nato per gioco, diventato punto di riferimento nazionale per il filtraggio della pubblicità invasiva su una moltitudine di siti web nostrani e internazionali. Il sito web del progetto è disponibile pubblicamente all'indirizzo https://xfiles.noads.it.

![NoAds X Files - xfiles.noads.it](https://gioxx.org/wp-content/uploads/2020/07/abp-x-files-nuovo-processo-di-creazione-della-lista-stabile-e-di-hws.jpg)

ABP: AdBlock Plus
-----------------

**[Adblock Plus](https://adblockplus.org/)** (ABP) è un componente aggiuntivo per i browser che filtra immagini, pubblicità, banner ed altri elementi "*bloccabili*" presenti sulle pagine web, permettendo quindi di navigare in un web più "*pulito e leggero*" poiché privo di pubblicità invasiva. Include inoltre funzioni di sincronizzazione e di whitelisting.

Le liste filtri X Files (chiamate anche "*moduli*") mantengono la loro piena (o quasi, in alcuni rari casi) compatibilità con componenti aggiuntivi alternativi ad ABP, come **uBlock Origin** o **AdBlock**.

Personalmente ho scelto di utilizzare (dopo anni di pura fedeltà per AdBlock Plus) **uBlock Origin sia su Firefox che su Google Chrome**. È leggero, ricco di opzioni (anche avanzate) e include diverse funzioni che permettono una pulizia più profonda delle pagine web visitate. Puoi scaricarlo e installarlo da [AMO](https://addons.mozilla.org/it/firefox/addon/ublock-origin) o [Chrome Store](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=it).

Come sottoscrivere le liste su uBlock Origin
-----------------

Ho scritto (e aggiornato) un documento apposito nel Wiki di questo progetto, lo trovi all'indirizzo https://github.com/gioxx/xfiles/wiki/NoAds-X-Files:-sottoscrizione-liste-con-uBlock-Origin.

![NoAds X Files - Custom lists on uBlock Origin](https://xfiles.noads.it/img/ublock/ublock_scr-fullpage.png)

I moduli "*X Files*"
-------------------

- **X Files** (Modulo principale) "*xfs*": specifico per siti web italiani ma con un occhio di riguardo anche per quelli internazionali più visitati, è il modulo principale e lista ufficialmente riconosciuta (per l'Italia).
Salvo problemi bloccanti e dall'impatto diffuso (tipicamente causati da un filtro), la lista stabile viene aggiornata ogni quindici giorni circa (*giorno 1 e 15 di ciascun mese, a mezzanotte*), diversamente puoi fare riferimento alla lista instabile e non supportata "**[eXperimental Files](https://raw.githubusercontent.com/gioxx/xfiles/master/experimental.txt)**" (*exp*), la quale viene aggiornata molto più spesso.
- **NoFacebookAds** "*nfa*": nato dall'esigenza di bloccare le pubblicità sempre più presenti sul noto Social Network, questo modulo va a completare la protezione offerta da X Files. Compatibile con *X Files* (*anche in versione eXperimental*), *UPD* e *Harmful WebSites*.
- **Harmful WebSites** "*hws*": il modulo che serve a proteggere la navigazione dell'utente impedendogli di caricare dati da siti web potenzialmente pericolosi, si integra perfettamente con le sottoscrizioni già presenti nel tuo componente aggiuntivo. Si basa sui domini ancora attivi censiti dal [BlackBook di  Miroslav Stampar](https://github.com/stamparm/blackbook), sull'[investigazione NSO 2021-07-18 di Amnesty Tech](https://github.com/AmnestyTech/investigations/tree/master/2021-07-18_nso) e sulla [NSA/CIA Blocklist di CHEF-KOCH](https://github.com/tigthor/NSA-CIA-Blocklist) (una copia messa al sicuro da  Thierry Byiringiro). Compatibile con *X Files* (*anche in versione eXperimental*), *UPD* e *NoFacebookAds*.
- **uBlock Phishing Domains** "*upd*": il modulo che serve a proteggere la navigazione dell'utente impedendogli di caricare dati da siti web potenzialmente pericolosi, **specificatamente pensato per uBlock Origin** e ancora più ricco di *Harmful WebSites*. Si appoggia al database [Phishing.Database di Mitchell Krog](https://github.com/mitchellkrogza/Phishing.Database), sull'[investigazione NSO 2021-07-18 di Amnesty Tech](https://github.com/AmnestyTech/investigations/tree/master/2021-07-18_nso) e sulla [NSA/CIA Blocklist di CHEF-KOCH](https://github.com/tigthor/NSA-CIA-Blocklist) (una copia messa al sicuro da  Thierry Byiringiro). Compatibile con *X Files* (*anche in versione eXperimental*), *Harmful WebSites* e *NoFacebookAds*.

> **Attenzione**: a partire dal primo settembre 2019 **la lista filtri "NoCoin" non è più mantenuta e supportata** (è stata definitivamente cancellata da questo repository il 18/8/21).
>
> Sul sito web ufficiale ho reso disponibile un'alternativa immediatamente sottoscrivibile, vedi https://gioxx.org/2019/09/02/abp-x-files-le-necessarie-modifiche-per-hws-e-nocoin/.

Tutti i moduli si possono sottoscrivere gratuitamente dalla pagina ufficiale del progetto, all'indirizzo [xfiles.noads.it](https://xfiles.noads.it/).

Licenza d'uso, distribuzione e supporto
---------------------------------------

Dove non diversamente specificato, tutto il materiale facente parte del progetto **NoAds X Files viene rilasciato con licenza Creative Commons, versione 4.0 by-nc-sa generica**, descritta punto per punto a questo indirizzo: [creativecommons.org/licenses/by-nc-sa/4.0/deed.it](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.it) (oppure in inglese: [creativecommons.org/licenses/by-nc-sa/4.0/deed.en](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en)).

Please note that NoAds X Files have a strict "*Italian policy*". No support is offered for websites of any other language. If you require support for a different website, I suggest that you remove the X Files list and choose a subscription better suited to your browsing needs (from the [Known Adblock Plus subscriptions page](http://adblockplus.org/en/subscriptions)).

Grazie!
-------

Qualche ringraziamento:

- alla [Community di Mozilla Italia](https://forum.mozillaitalia.org) per il costante sostegno e la collaborazione,
- a tutti i curatori dei database dai quali questo progetto attinge quotidianamente nuovi URL,
- a [GitHub](https://github.com/) per tutto ciò che mette a disposizione,
- a [stackedit.io/app](https://stackedit.io/app) per l'ottimo editor MD online,
- alla mia pazienza e ai soldi che investo in queste idee e progetti che non vengono mantenuti (economicamente parlando) da nessun altro (speriamo duri ancora per molto).
