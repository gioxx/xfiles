# 🌐 UPD: Domains Only

Questa versione ridotta del modulo **UPD (uBlock Phishing Domains)** contiene **esclusivamente i domini**, estratti e formattati senza sintassi specifica per Adblock/uBlock.

📦 Il file viene generato automaticamente e aggiornato quotidianamente tramite GitHub Actions.

🔧 **Scopo principale**: fornire un elenco raw di domini potenzialmente dannosi, adatto a strumenti o progetti esterni che richiedano input in formato semplice.

---

## 🧩 Utilizzo

Questa lista è pensata per l'integrazione con strumenti esterni come:

- [blocklist-tools/blocklist-tools](https://github.com/blocklist-tools/blocklist-tools)
- Sistemi di DNS filtering
- Firewall o altri strumenti automatizzati di controllo dominio

---

## 📌 Caratteristiche

- ✅ Solo domini, uno per riga
- ❌ Nessuna annotazione, commento o sintassi Adblock/uBO
- 🕘 Aggiornamento quotidiano tramite Action `make_domains.yml`
- 📂 File generato: [`domains/upd_domains.txt`](/domains/upd_domains.txt)

---

## 🤝 Come contribuire

Per richiedere modifiche o segnalare falsi positivi/negativi:

- 📩 [Apri una nuova issue](https://github.com/gioxx/xfiles/issues/new/choose)
- ✍️ Oppure modifica direttamente [`contrib/upd_exclude`](/contrib/upd_exclude) per escludere domini specifici dalla lista.

---

## 📜 Licenza

Questo file, come tutto il progetto **NoAds X Files**, è rilasciato sotto licenza:

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

---
