#!/bin/bash
set -e
# pet
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/knqyf263/pet/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"