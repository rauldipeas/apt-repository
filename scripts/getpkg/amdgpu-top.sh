#!/bin/bash
set -e
# AMD GPU top
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/Umio-Yasuno/amdgpu_top/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"