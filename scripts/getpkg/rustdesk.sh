#!/bin/bash
set -e
# RustDesk
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/rustdesk/rustdesk/releases|grep browser_download_url|grep x86_64.deb|head -n1|cut -d '"' -f4)"