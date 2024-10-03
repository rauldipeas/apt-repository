#!/bin/bash
set -e
# VeraCrypt
wget -q --show-progress "$(wget -qO- https://www.veracrypt.fr/en/Downloads.html|grep amd64.deb|head -n1|cut -d '"' -f2|sed 's/&#43;/+/g')"