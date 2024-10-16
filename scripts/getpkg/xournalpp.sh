#!/bin/bash
set -e
# Xournal++
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/xournalpp/xournalpp/releases|grep browser_download_url|grep -v dev|grep Debian|grep deb|head -n1|cut -d '"' -f4)"