#!/bin/bash
set -e
# pacstall
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/pacstall/pacstall/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"