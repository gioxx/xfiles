#!/bin/bash

emit_xfiles_section_header() {
    case "$(basename -- "$1")" in
        xfiles_00-whitelist) printf '%s\n' '! [NoAds X Files - Whitelist]/whitelist' ;;
        xfiles_01-adsnoninvasivi) printf '%s\n' '! [NoAds X Files - ADS non invasivi]' ;;
        xfiles_10-rootdomains) printf '%s\n' '! [NoAds X Files - Domini radice bloccati]' ;;
        xfiles_11-specifici) printf '%s\n' '! [NoAds X Files - Filtri specifici]' ;;
        xfiles_12-elementibloccati) printf '%s\n' '! [NoAds X Files - Elementi bloccati]/blocking' ;;
        xfiles_13-elementinascosti) printf '%s\n' '! [NoAds X Files - Elementi nascosti]/elemhide' ;;
        xfiles_14-ublockscripts) printf '%s\n' '! [NoAds X Files - Filtri script inline per uBlock]' ;;
        xfiles_20-sperimentali) printf '%s\n' '! [NoAds X Files - Filtri sperimentali]' ;;
        xfiles_21-idcac) printf '%s\n' '! [NoAds X Files - Filtri per blocco popup accettazione Cookie (sperimentale)]' ;;
        xfiles_30-abusorisorse) printf '%s\n' '! [NoAds X Files - Filtri per blocco abuso risorse CPU / Exploit]' ;;
        xfiles_contrib) printf '%s\n' '! [NoAds X Files - Contributi dagli utenti]' ;;
    esac
}
