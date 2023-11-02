#!/bin/bash
set -e
# Stremio
#wget -q --show-progress "$(wget -qO- https://www.stremio.com/downloads|grep .deb|cut -d '"' -f286)"
sudo apt install -y\
    build-essential\
    checkinstall\
    cmake\
    git\
    libmpv-dev\
    librsvg2-bin\
    libssl-dev\
    nodejs\
    qml-module-qt-labs-platform\
    qml-module-qtquick-controls\
    qml-module-qtquick-dialogs\
    qml-module-qtwebchannel\
    qml-module-qtwebengine\
    qt5-qmake\
    qtdeclarative5-dev\
    qtdeclarative5-dev-tools\
    qtwebengine5-dev\
    sudo\
    wget
git clone https://github.com/Stremio/stremio-shell.git
cd stremio-shell
if [ -n "$1" ]; then
	git checkout "$1"
fi
git submodule update --init
cp dist-utils/common/description ./description-pak
cp dist-utils/common/postinstall ./postinstall-pak
cp dist-utils/common/preremove ./preremove-pak
make -f release.makefile clean
make -f release.makefile
wget -q --show-progress https://dl.strem.io/server/v4.20.2/desktop/server.js -O build/server.js 
sudo checkinstall\
    --default\
    --install=no\
    --fstrans=yes\
    --pkgname stremio\
    --pkgversion "$(./dist-utils/common/get-version.sh)"\
    --pkggroup video\
    --pkglicense="MIT"\
    --nodoc\
    --pkgarch="$(dpkg --print-architecture)"\
    --requires="nodejs,libmpv1 \(\>=0.30.0\),qml-module-qt-labs-platform \(\>=5.9.5\),qml-module-qtquick-controls \(\>=5.9.5\),qml-module-qtquick-dialogs \(\>=5.9.5\),qml-module-qtwebchannel \(\>=5.9.5\),qml-module-qtwebengine \(\>=5.9.5\),qml-module-qt-labs-folderlistmodel \(\>=5.9.5\),qml-module-qt-labs-settings \(\>=5.9.5\),librubberband2 \(\>=1.8.1\),libuchardet0  \(\>=0.0.6\),libfdk-aac2 \(\>=2.0.2\)"\
    make -f release.makefile install
cd ..
cp stremio-shell/*.deb .
rm -r stremio-shell
wget -q --show-progress	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/"$(wget -qO- http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)"
wget -q --show-progress http://security.ubuntu.com/ubuntu/pool/main/o/openssl/"$(wget -qO- http://security.ubuntu.com/ubuntu/pool/main/o/openssl/|grep libssl1.1_|grep amd64.deb|head -n1|cut -d '"' -f8)"