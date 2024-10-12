#!/bin/bash
set -e
# cpupower-gui
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/vagnum08/cpupower-gui/releases|grep browser_download_url|grep all.deb|head -n1|cut -d '"' -f4)"