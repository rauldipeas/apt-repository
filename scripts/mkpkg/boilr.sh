#!/bin/bash
set -e
# BoilR
wget -q --show-progress\
    "$(wget -qO-\
        https://api.github.com/repos/PhilipK/BoilR/releases|\
        grep browser_download_url|grep download|head -n1|cut -d '"' -f4)"
mkdir -p boilr/DEBIAN boilr/usr/{bin,share/applications,share/pixmaps}
mv linux_BoilR boilr/usr/bin/boilr
wget -q --show-progress\
    https://raw.githubusercontent.com/PhilipK/BoilR/main/resources/256/io.github.philipk.boilr.png
mv io.github.philipk.boilr.png boilr/usr/share/pixmaps/boilr.png
cat <<EOF |tee boilr/usr/share/applications/boilr.desktop
[Desktop Entry]
Name=BoilR
Icon=boilr
Exec=boilr
StartupNotify=true
Categories=Game;
Terminal=false
EOF
BOILR_TAG="$(wget -qO-\
    https://api.github.com/repos/PhilipK/BoilR/releases|\
    grep tag|grep -v Next|head -n1|cut -d '"' -f4|\
    sed 's@https://github.com/PhilipK/BoilR/releases/tag/v.@@g')"
cat <<EOF |tee boilr/DEBIAN/control>/dev/null
Package: boilr
Version: $BOILR_TAG
Depends: steam
Section: game
Priority: optional
Architecture: amd64
Maintainer:  Philip Kristoffersen <philipkristoffersen@gmail.com>
Description: Synchronize games from other platforms into your Steam library.
EOF
dpkg-deb -b boilr .
mv boilr*.deb assets/packages
rm -r boilr*