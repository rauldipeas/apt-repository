#!/bin/bash
set -e
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/ciderapp/cider-releases/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"