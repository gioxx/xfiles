<img src="https://xfiles.noads.it/img/xfiles_shadow_icon23.png" alt="NoAds X Files banner" width="180"/>

# 🤝 Come contribuire direttamente?

Questa cartella contiene tutti i file che contribuiscono alla costruzione delle liste filtri **X Files**, **NoFacebookAds (NFA)**, **Harmful WebSites (HWS)** e **uBlock Phishing Domains (UPD)**.

Puoi partecipare proponendo nuove regole tramite [una nuova issue](https://github.com/gioxx/xfiles/issues/new/choose) oppure modificando direttamente i file *contrib* più rilevanti.

## 📦 X Files (modulo principale)

Per proporre filtri destinati al modulo principale **X Files**:

- ➕ Apri una [issue GitHub](https://github.com/gioxx/xfiles/issues/new/choose) descrivendo il problema.
- ✍️ Aggiungi direttamente i filtri in [`xfiles_contrib`](/contrib/xfiles_contrib), file utilizzato per raccogliere suggerimenti e regole ancora da categorizzare.

### 📚 Basi dati specifiche

Puoi anche proporre modifiche alle basi dati tematiche, che vengono aggregate per generare la lista stabile:

| File | Descrizione |
|------|-------------|
| [`xfiles_00-whitelist`](/contrib/xfiles_00-whitelist) | Domini o elementi da ignorare. |
| [`xfiles_01-adsnoninvasivi`](/contrib/xfiles_01-adsnoninvasivi) | Pubblicità non invasive da escludere dal blocco. |
| [`xfiles_10-rootdomains`](/contrib/xfiles_10-rootdomains) | Domini radice usati per fini pubblicitari. |
| [`xfiles_11-specifici`](/contrib/xfiles_11-specifici) | Regole mirate per blocchi specifici. |
| [`xfiles_12-elementibloccati`](/contrib/xfiles_12-elementibloccati) | Elementi esterni (es. popup, tracciamenti). |
| [`xfiles_13-elementinascosti`](/contrib/xfiles_13-elementinascosti) | Filtri cosmetici per nascondere spazi vuoti o banner. |
| [`xfiles_14-ublockscripts`](/contrib/xfiles_14-ublockscripts) | Script inline compatibili con uBlock Origin. |
| [`xfiles_20-sperimentali`](/contrib/xfiles_20-sperimentali) | Nuovi filtri in fase di test per la lista eXperimental. |
| [`xfiles_21-idcac`](/contrib/xfiles_21-idcac) | Blocca popup di accettazione Cookie. |
| [`xfiles_30-abusorisorse`](/contrib/xfiles_30-abusorisorse) | Contro abuso CPU/risorse locali, erede del modulo *NoCoin*. |

---

## 📘 NoFacebookAds (NFA)

Per proporre filtri destinati alla lista **NoFacebookAds**:

- 📩 Apri una [issue GitHub](https://github.com/gioxx/xfiles/issues/new/choose).
- ✍️ Oppure modifica direttamente [`nfa`](/contrib/nfa), file che raccoglie tutte le regole create o suggerite per bloccare le pubblicità su Facebook.

---

## 🛡 Harmful WebSites & uBlock Phishing Domains (HWS / UPD)

Per segnalare URL o domini pericolosi da includere nei moduli **HWS** e/o **UPD**:

- 📩 Apri una [issue GitHub](https://github.com/gioxx/xfiles/issues/new/choose).
- ✍️ Oppure modifica direttamente [`siteblock_contrib`](/contrib/siteblock_contrib), contenente URL sospetti o segnalazioni da parte della community.

### ⚠️ Eccezioni / Whitelist

In caso di **falsi positivi** rilevati nei moduli HWS o UPD, puoi segnalare i domini da escludere modificando il file:

- [`upd_exclude`](/contrib/upd_exclude): verranno rimossi automaticamente dalle liste finali in fase di compilazione.

---

💡 *Ogni contributo è prezioso. Grazie per sostenere il progetto X Files!*
