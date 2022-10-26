#!/bin/bash
set -e
# qc
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/qownnotes/qc/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"