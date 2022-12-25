#!/bin/bash
set -e
# CFS Zen tweaks
wget -q --show-progress\
    "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN"\
    https://api.github.com/repos/igo95862/cfs-zen-tweaks/releases|\
	grep browser_download_url|grep download|grep .deb|head -n1|cut -d '"' -f4)"