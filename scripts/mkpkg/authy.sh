#!/bin/bash
set -e
# Authy
sudo apt install -y squashfs-tools
mkdir -p authy
cd authy
wget -qO- 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=authy-electron'|grep -v ^depends|tee PKGBUILD>/dev/null
wget -qO- 'https://aur.archlinux.org/cgit/aur.git/plain/no-sandbox.sh?h=authy-electron'|tee no-sandbox.sh>/dev/null
makedeb -H 'Section: security'
cd ..
mv authy/authy*.deb .
rm -r authy