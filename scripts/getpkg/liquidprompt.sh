#!/bin/bash
set -e
# liquidprompt
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/l/liquidprompt/$(wget -qO- http://ftp.us.debian.org/debian/pool/main/l/liquidprompt/|grep all.deb|tail -n1|cut -d '"' -f8)