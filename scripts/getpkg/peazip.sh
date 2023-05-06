
#!/bin/bash
set -e
# PeaZip
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/peazip/PeaZip/releases|grep browser_download_url|grep amd64.deb|grep Qt|head -n1|cut -d '"' -f4)"