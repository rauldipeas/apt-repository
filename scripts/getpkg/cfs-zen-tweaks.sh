#!/bin/bash
set -e
# CFS Zen tweaks
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/igo95862/cfs-zen-tweaks/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"