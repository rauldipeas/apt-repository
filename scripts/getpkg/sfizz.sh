#!/bin/bash
set -e
# Sfizz
rm -rf sfizz*.deb
aria2c --console-log-level=error --summary-interval=0\
	https://download.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_20.04/amd64/sfizz_1.2.0-0_amd64.deb
#aria2c --console-log-level=error --summary-interval=0\
#	 	"$(wget -qO-\
#		'https://software.opensuse.org/download.html?project=home%3Asfztools%3Asfizz&package=sfizz'|\
#	 	grep amd64.deb|grep 20.04|cut -d '"' -f2)"
rm -rf sfizz*.metalink