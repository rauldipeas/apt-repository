#!/bin/bash
set -e
# Sfizz
#wget -q --show-progress	"$(wget -qO- 'https://software.opensuse.org/download.html?project=home%3Asfztools%3Asfizz&package=sfizz'|grep amd64.deb|grep 22.04|cut -d '"' -f2)"
wget -q --show-progress https://mirrorcache-us.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_22.04/amd64/"$(wget -qO- https://mirrorcache-us.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_22.04/amd64/|grep amd64.deb|cut -d '"' -f4|sed 's@./@@g'|grep ^sfizz|grep -v mirrorlist)"