#!/bin/bash
set -e
# Windscribe
wget -q --show-progress -O windscribe_amd64.deb https://windscribe.net/"$(wget -qO- https://windscribe.net/guides/linux|grep linux_deb_x64|cut -d '"' -f4)"