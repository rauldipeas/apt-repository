#!/bin/bash
set -e
# PeaZip
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/peazip/PeaZip/releases|\
	grep browser_download_url|grep .deb|grep Qt5|head -n1|cut -d '"' -f4)"