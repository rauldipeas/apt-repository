#!/bin/bash
set -e
# CFS Zen tweaks
rm -rf cfs-zen-tweaks*.deb
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/igo95862/cfs-zen-tweaks/releases|\
	grep browser_download_url|grep download|grep .deb|head -n1|cut -d '"' -f4)"