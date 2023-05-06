#!/bin/bash
set -e
# fd
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/sharkdp/fd/releases|grep browser_download_url|grep amd64.deb|grep -v musl|head -n1|cut -d '"' -f4)"