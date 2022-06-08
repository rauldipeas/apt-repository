#!/bin/bash
set -e
# RClone
rm -rf rclone*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/dimitrov-adrian/RcloneTray/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/rclone/rclone/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"