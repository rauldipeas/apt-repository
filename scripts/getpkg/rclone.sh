#!/bin/bash
set -e
# RClone
wget -q --show-progress\
	"$(wget -qO-\
	https://api.github.com/repos/dimitrov-adrian/RcloneTray/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"
#wget -q --show-progress\
#	"$(wget -qO-\
#	https://api.github.com/repos/rclone/rclone/releases|\
#	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"