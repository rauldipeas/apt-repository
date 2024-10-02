#!/bin/bash
set -e
# micro
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/zyedidia/micro/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"