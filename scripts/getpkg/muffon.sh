#!/bin/bash
set -e
# Muffon
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/staniel359/muffon/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"