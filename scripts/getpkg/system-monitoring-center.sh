#!/bin/bash
set -e
# System Monitoring Center
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/hakandundar34coding/system-monitoring-center/releases|\
	grep browser_download_url|grep all.deb|head -n1|cut -d '"' -f4)"