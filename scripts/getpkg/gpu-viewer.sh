#!/bin/bash
set -e
# GPU viewer
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/arunsivaramanneo/GPU-Viewer/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"