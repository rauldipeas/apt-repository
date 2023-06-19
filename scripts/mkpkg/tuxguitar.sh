#!/bin/bash
set -e
# TuxGuitar
TG_SOURCEFORGE='https://sourceforge.net/projects/tuxguitar/files/TuxGuitar'
TG_VERSION=$(wget -qO- https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/|grep timeline|head -n1|cut -d '/' -f6)
TG_DEB=$(wget -qO- https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/$(wget -qO- https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/|grep timeline|head -n1|cut -d '/' -f6)|grep x86_64.deb|head -n1|cut -d '"' -f2)
TG_TAR=$(wget -qO- https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/$(wget -qO- https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/|grep timeline|head -n1|cut -d '/' -f6)|grep tar.gz|grep qt5|head -n1|cut -d '"' -f2)
wget -q --show-progress $TG_SOURCEFORGE/$TG_VERSION/$TG_DEB
dpkg-deb -x tuxguitar*.deb tuxguitar
dpkg-deb -e tuxguitar*.deb tuxguitar/DEBIAN
rm tuxguitar*.deb
wget -q --show-progress $TG_SOURCEFORGE/$TG_VERSION/$TG_TAR
tar fxz tuxguitar*.tar.gz
rm tuxguitar*.tar.gz
rm -r tuxguitar/opt/tuxguitar
mv tuxguitar-*-linux-qt5-x86_64 tuxguitar/opt/tuxguitar
mkdir -p tuxguitar/usr/share/pixmaps
cp tuxguitar/opt/tuxguitar/share/skins/Oxygen/icon-96x96.png tuxguitar/usr/share/pixmaps/tuxguitar.png
sed -i 's@Icon=/opt/tuxguitar/share/skins/Oxygen/icon-96x96.png@Icon=tuxguitar@g' tuxguitar/usr/share/applications/tuxguitar.desktop
dpkg-deb -b tuxguitar .
rm -r tuxguitar