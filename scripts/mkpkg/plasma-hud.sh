#!/bin/bash
set -e
# Plasma HUD
mkdir -p plasma-hud/{DEBIAN,usr/lib/plasma-hud,etc/xdg/autostart}
git clone -q https://github.com/Zren/plasma-hud plasma-hud-source
cp -r plasma-hud-source/usr/lib/plasma-hud/plasma-hud plasma-hud/usr/lib/plasma-hud/
cp -r plasma-hud-source/etc/xdg/autostart/plasma-hud.desktop plasma-hud/etc/xdg/autostart/
PLASMA_HUD_TAG="$(git ls-remote --sort='version:refname' -t https://github.com/Zren/plasma-hud|cut -d '/' -f3|tail -n1)"
cat <<EOF |tee plasma-hud/DEBIAN/control>/dev/null
Package: plasma-hud
Version: $PLASMA_HUD_TAG
Depends: appmenu-gtk2-module, appmenu-gtk3-module, gir1.2-gtk-3.0, rofi, python3, python3-dbus, python3-setproctitle, python3-xlib
Section: desktop
Priority: optional
Architecture: amd64
Installed-Size: $(du -s plasma-hud|sed 's/ //g'|sed 's/plasma-hud//g')
Maintainer:  Chris Holland <Zren@github.com>
Description: Provides a way to run menubar commands in KDE Plasma through rofi, much like the Unity 7 Heads-Up Display (HUD).
EOF
cd plasma-hud
find -type f|sed 's@\./@@g'|grep -v DEBIAN|xargs md5sum>DEBIAN/md5sums
cd ..
dpkg-deb -b plasma-hud .
cp plasma-hud*.deb assets/packages/
rm -r plasma-hud*