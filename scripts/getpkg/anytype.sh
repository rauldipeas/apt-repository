#!/bin/bash
set -e
# Anytype
#wget -q --show-progress --content-disposition https://download.anytype.io/"$(wget -qO- https://download.anytype.io/|grep Debian|cut -d '"' -f2)"
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/anyproto/anytype-ts/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"