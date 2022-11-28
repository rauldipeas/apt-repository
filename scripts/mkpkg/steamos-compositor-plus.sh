#!/bin/bash
set -e
# Steam OS compositor plus
git clone -q https://github.com/ChimeraOS/steamos-compositor-plus
cd steamos-compositor-plus
apt-fast install -y\
    automake1.11\
    debhelper\
    devscripts\
    libgl1-mesa-dev\
    libsdl-image1.2-dev\
    libudev-dev\
    libx11-dev\
    libxcomposite-dev\
    libxdamage-dev\
    libxrandr-dev\
    libxrender-dev\
    libxxf86vm-dev
sed -i 's/steamdeck/gamepadui/g' usr/bin/steamos-session
dpkg-buildpackage -b -us -uc
cd ..
mv steamos-compositor-plus*.deb assets/packages
rm -r steamos-compositor-plus*
