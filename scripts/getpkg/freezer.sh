#!/bin/bash
set -e
# Freezer
rm -rf freezer*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://freezerapk.com/download|grep deb|cut -d '"' -f6)"