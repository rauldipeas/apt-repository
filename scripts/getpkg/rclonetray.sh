#!/bin/bash
set -e
# RcloneTray
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/dimitrov-adrian/RcloneTray/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"