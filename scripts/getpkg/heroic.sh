#!/bin/bash
set -e
# Heroic
rm -rf heroic.deb
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO- https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases|\
    grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"