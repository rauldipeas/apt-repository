#!/bin/bash
set -e
# LSD
rm -rf lsd*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/Peltoche/lsd/releases|\
	grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)"