#!/bin/bash
set -e
# Touche
wget -q --show-progress	"$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN"	https://api.github.com/repos/JoseExposito/touche/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"