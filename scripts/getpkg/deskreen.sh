#!/bin/bash
set -e
# Deskreen
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/pavlobu/deskreen/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"