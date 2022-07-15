#!/bin/bash
set -e
# Freezer
aria2c --console-log-level=error --summary-interval=0\
	http://security.ubuntu.com/ubuntu/pool/main/o/openssl/"$(\
	wget -qO-\
		http://security.ubuntu.com/ubuntu/pool/main/o/openssl/|\
		grep libssl1.1_|grep amd64.deb|head -n1|cut -d '"' -f8)"
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://freezerapk.com/download|grep deb|cut -d '"' -f6)"