#!/bin/bash
set -e
# Spotube
wget -q --show-progress	"$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN"	https://api.github.com/repos/KRTirtho/spotube/releases|grep browser_download_url|grep x86_64.deb|head -n1|cut -d '"' -f4)"