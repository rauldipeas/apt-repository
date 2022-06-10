#!/bin/bash
set -e
# Obsidian
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/obsidianmd/obsidian-releases/releases|\
    grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"