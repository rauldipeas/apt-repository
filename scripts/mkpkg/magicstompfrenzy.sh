#!/bin/bash
set -e
# MagicstompFrenzy
git clone -q https://github.com/dulnikovsky/magicstompfrenzy magicstompfrenzy-source
cd magicstompfrenzy-source
mkdir build
cd build
sudo apt install libasound2-dev qtbase5-dev qt5-qmake
qmake ../MagicstompFrenzy.pro
make
cd ../..
mkdir -p magicstompfrenzy/{DEBIAN,usr/bin,usr/share/applications,usr/share/pixmaps}
mv magicstompfrenzy-source/build/MagicstompFrenzy magicstompfrenzy/usr/bin/
wget -q --show-progress\
    -O magicstompfrenzy/usr/share/pixmaps/magicstompfrenzy.png\
    https://i.imgur.com/KxTo6Dz.png
cat <<EOF |tee magicstompfrenzy/usr/share/applications/magicstompfrenzy.desktop>/dev/null
[Desktop Entry]
Name=MagicstompFrenzy
Exec=MagicstompFrenzy
Icon=magicstompfrenzy
Terminal=false
Type=Application
Categories=AudioVideo;
EOF
MAGICSTOMPFRENZY_TAG="$(wget -qO-\
    https://api.github.com/repos/dulnikovsky/magicstompfrenzy/releases|\
    grep tag|head -n1|cut -d '"' -f4|\
    sed 's@https://github.com/dulnikovsky/magicstompfrenzy/releases/tag/v@@g')"
cat <<EOF |tee magicstompfrenzy/DEBIAN/control>/dev/null
Package: magicstompfrenzy
Version: $MAGICSTOMPFRENZY_TAG
Section: audio
Priority: optional
Architecture: amd64
Maintainer: dulnikovsky <dulnikovsky@github.com>
Description: Editor for Yamaha Magicstomp Guitar Effect Processor.
EOF
dpkg-deb -b magicstompfrenzy .
mv magicstompfrenzy*.deb assets/packages
rm -r magicstompfrenzy*