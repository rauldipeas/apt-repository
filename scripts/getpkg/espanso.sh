#!/bin/bash
set -e
# Espanso
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/federico-terzi/espanso/releases|grep browser_download_url|grep x11-amd64.deb|head -n1|cut -d '"' -f4)"