#!/bin/bash
set -e
# Ferdium
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/ferdium/ferdium-app/releases|grep browser_download_url|grep .deb|grep -v nightly|head -n1|cut -d '"' -f4)"