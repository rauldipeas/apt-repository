#!/bin/bash
set -e
# Freezer
rm -rf\
	freezer*.deb\
	libssl1.1*.deb
aria2c --console-log-level=error --summary-interval=0\
	http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.13_amd64.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://freezerapk.com/download|grep deb|cut -d '"' -f6)"