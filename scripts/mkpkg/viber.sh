#!/bin/bash
set -e

wget -q --show-progress\
    https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
dpkg-deb -x viber.deb viber
dpkg-deb -e viber.deb viber/DEBIAN
rm viber.deb
sed -i 's@Icon=/usr/share/pixmaps/viber.png@Icon=viber/g' viber/usr/share/applications/viber.desktop
echo 'StartupWMClass=Viber'|tee -a viber/usr/share/applications/viber.desktop
dpkg-deb -b viber .
mv viber*.deb assets/packages
rm -r viber*