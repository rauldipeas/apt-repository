#!/bin/bash
set -e
# LocalSend
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/localsend/localsend/releases|grep browser_download_url|grep x86-64.deb|head -n1|cut -d '"' -f4)"