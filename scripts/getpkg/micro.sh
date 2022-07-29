#!/bin/bash
set -e
# Micro
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/zyedidia/micro/releases|\
	grep browser_download_url|grep download|grep .deb|head -n1|cut -d '"' -f4)"