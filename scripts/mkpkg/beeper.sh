#!/bin/bash
set -e
# Beeper
wget -q --show-progress --content-disposition https://download.beeper.com/linux/appImage/x64
chmod +x beeper*.AppImage
./beeper*.AppImage --appimage-extract
mkdir -p beeper/{DEBIAN,opt,usr/share/applications}
mv squashfs-root/beeper.desktop beeper/usr/share/applications/
sed -i 's@AppRun --no-sandbox@/opt/beeper/beeper --no-sandbox@g' beeper/usr/share/applications/beeper.desktop
mv squashfs-root/usr/share/icons beeper/usr/share/
rm -r squashfs-root/{.DirIcon,AppRun,usr}
mv squashfs-root beeper/opt/beeper
BEEPER_VERSION="$(fd beeper*.AppImage|cut -d '-' -f2|cut -d '.' -f1-3)"
cat <<EOF |tee beeper/DEBIAN/control>/dev/null
Package: beeper
Version: $BEEPER_VERSION
Depends: libayatana-appindicator3-1
Architecture: amd64
Maintainer:  Beeper <info@beeper.com>
Priority: optional
Description: Beeper is a universal messaging app that lets you chat with anyone on any chat app, including Whatsapp, iMessage, Telegram and 12 other networks.
EOF
dpkg-deb -b beeper