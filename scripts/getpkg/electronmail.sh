#!/bin/bash
set -e
# ElectronMail
wget -q --show-progress\
    "$(wget -qO-\
    https://api.github.com/repos/vladimiry/ElectronMail/releases|\
	grep browser_download_url|grep download|grep .deb|head -n1|cut -d '"' -f4)"