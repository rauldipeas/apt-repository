#!/bin/bash
set -e
# TuxGuitar
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/helge17/tuxguitar/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"