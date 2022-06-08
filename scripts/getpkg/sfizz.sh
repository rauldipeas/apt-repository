#!/bin/bash
set -e
# Sfizz
rm -rf sfizz*.deb
aria2c --console-log-level=error --summary-interval=0\
	http://download.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_20.04/amd64/"$(wget -qO- 'http://download.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_20.04/amd64/'|grep amd64.deb|cut -d '"' -f4|tail -n1)"
rm -rf sfizz*.metalink