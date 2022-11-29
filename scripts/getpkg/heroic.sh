#!/bin/bash
set -e
# Heroic
wget -q --show-progress\
    "$(wget -qO-\
    https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases|\
    grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"