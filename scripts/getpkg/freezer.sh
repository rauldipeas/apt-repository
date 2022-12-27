#!/bin/bash
set -e
# Freezer
wget -q --show-progress http://security.ubuntu.com/ubuntu/pool/main/o/openssl/"$(wget -qO- http://security.ubuntu.com/ubuntu/pool/main/o/openssl/|grep libssl1.1_|grep amd64.deb|head -n1|cut -d '"' -f8)"
wget -q --show-progress "$(wget -qO- https://freezerapk.com/download|grep deb|cut -d '"' -f6)"