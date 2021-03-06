#!/bin/bash
set -e
# Plasma HUD
mkdir -p plasma-hud/{DEBIAN,usr/lib/plasma-hud,etc/xdg/autostart}
git clone -q https://github.com/Zren/plasma-hud plasma-hud-source
cp -rf plasma-hud-source/usr/lib/plasma-hud/plasma-hud plasma-hud/usr/lib/plasma-hud/
cp -rf plasma-hud-source/etc/xdg/autostart/plasma-hud.desktop plasma-hud/etc/xdg/autostart/
PLASMA_HUD_TAG="$(wget -qO- https://api.github.com/repos/Zren/plasma-hud/releases|\
	grep tag|head -n1|cut -d '"' -f4|sed 's@https://github.com/Zren/plasma-hud/releases/tag/@@g')"
cat <<EOF |tee plasma-hud/DEBIAN/control>/dev/null
Package: plasma-hud
Version: $PLASMA_HUD_TAG
Depends: appmenu-gtk2-module, appmenu-gtk3-module, gir1.2-gtk-3.0, rofi, python3, python3-dbus, python3-setproctitle, python3-xlib
Section: desktop
Priority: optional
Architecture: amd64
Installed-Size: $(du -s plasma-hud|sed 's/ //g'|sed 's/plasma-hud//g')
Maintainer: Martchus <Martchus@github.com>
Description: Tray application and Dolphin/Plasma integration for Syncthing.
EOF
cd plasma-hud
find -type f|\
	sed 's@\./@@g'|\
	grep -v DEBIAN|\
	xargs md5sum\
	>DEBIAN/md5sums
cd ..
dpkg-deb -b plasma-hud .
cp\
	plasma-hud*.deb\
	assets/packages/
rm -rf plasma-hud*