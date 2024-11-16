#!/bin/bash
set -e
# Mailspring
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/Foundry376/Mailspring/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"