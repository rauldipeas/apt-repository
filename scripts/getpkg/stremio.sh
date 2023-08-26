#!/bin/bash
set -e
# Stremio
wget -q --show-progress	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/"$(wget -qO- http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)"
wget -q --show-progress http://security.ubuntu.com/ubuntu/pool/main/o/openssl/"$(wget -qO- http://security.ubuntu.com/ubuntu/pool/main/o/openssl/|grep libssl1.1_|grep amd64.deb|head -n1|cut -d '"' -f8)"
wget -q --show-progress "$(wget -qO- https://www.stremio.com/downloads|grep amd64.deb|cut -d '"' -f286)"