#/bin/bash
set -e
# Container Desktop
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/iongion/container-desktop/releases|grep browser_download_url|grep amd64|grep .deb|head -n1|cut -d '"' -f4)"