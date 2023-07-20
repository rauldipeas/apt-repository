#!/bin/bash
set -e
# Filen
wget -cq --show-progress https://cdn.filen.io/desktop/release/filen_x86_64.AppImage
chmod +x filen_x86_64.AppImage
./filen_x86_64.AppImage --appimage-extract
mkdir -p filen-desktop/{DEBIAN,opt,usr/share/applications}
mv squashfs-root/filen-desktop.desktop filen-desktop/usr/share/applications/
sed -i 's@AppRun --no-sandbox@/opt/filen-desktop/filen-desktop --no-sandbox@g' filen-desktop/usr/share/applications/filen-desktop.desktop
mv squashfs-root/usr/share/icons filen-desktop/usr/share/
rm -r squashfs-root/{.DirIcon,AppRun,usr}
mv squashfs-root filen-desktop/opt/filen-desktop
cp assets/filen-desktop/*.png filen-desktop/opt/filen-desktop/resources/app/src/assets/icons/tray/
FILEN_VERSION="$(cat filen-desktop/opt/filen-desktop/resources/app/package.json|grep version|head -n1|cut -d '"' -f4)"
cat <<EOF |tee filen-desktop/DEBIAN/control>/dev/null
Package: filen-desktop
Version: $FILEN_VERSION
Depends: libayatana-appindicator3-1
Architecture: amd64
Maintainer:  Filen Cloud Dienste  <FilenCloudDienste@github.com>
Priority: optional
Description:  Desktop client for Filen.io
EOF
dpkg-deb -b filen-desktop