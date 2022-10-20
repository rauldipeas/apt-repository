#!/bin/bash
set -e
# Stremio
aria2c --console-log-level=error --summary-interval=0\
	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/\
"$(wget -qO-\
	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|\
	grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)"
#aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://www.stremio.com/downloads|\
	grep amd64.deb|cut -d '"' -f222)"