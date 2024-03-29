#!/bin/bash
set -e
# BoilR
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/PhilipK/BoilR/releases|grep browser_download_url|grep linux_BoilR|head -n1|cut -d '"' -f4)"
mkdir -p boilr/DEBIAN boilr/usr/{bin,share/applications,share/pixmaps}
mv linux_BoilR boilr/usr/bin/boilr
chmod +x boilr/usr/bin/boilr
wget -q --show-progress https://raw.githubusercontent.com/PhilipK/BoilR/main/resources/256/io.github.philipk.boilr.png
mv io.github.philipk.boilr.png boilr/usr/share/pixmaps/boilr.png
cat <<EOF |tee boilr/usr/share/applications/boilr.desktop>/dev/null
[Desktop Entry]
Name=BoilR
Icon=boilr
Exec=boilr
StartupNotify=true
Categories=Game;
Terminal=false
EOF
BOILR_TAG="$(git ls-remote --sort='version:refname' -t https://github.com/PhilipK/BoilR|grep -v -e 'v0' -e 'v1'|cut -d '/' -f3|tail -n1|cut -d '.' -f2-4)"
cat <<EOF |tee boilr/DEBIAN/control>/dev/null
Package: boilr
Version: $BOILR_TAG
Depends: steam|steam-launcher
Section: game
Priority: optional
Architecture: amd64
Maintainer:  Philip Kristoffersen <philipkristoffersen@gmail.com>
Description: Synchronize games from other platforms into your Steam library.
EOF
dpkg-deb -b boilr .
rm -r boilr