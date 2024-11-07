#!/bin/bash
set -e
# Tribler
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/Tribler/tribler/releases|grep browser_download_url|grep all.deb|head -n1|cut -d '"' -f4)"