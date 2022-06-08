#!/bin/bash
set -e
# Lark Docs #TODO
rm -rf larkdocs*
sudo apt install -y npm
sudo npm install -g nativefier
aria2c --console-log-level=error --summary-interval=0\
	'https://p16-hera-va.ibyteimg.com/tos-useast2a-i-hn4qzgxq2n/bf9a8171ac3e4d0d9b82b1558024b7d9~tplv-hn4qzgxq2n-image:0:0.image'\
	-o icon.png
nativefier\
	-p linux\
	-a x64\
	-i icon.png\
	--disable-context-menu\
	--disable-dev-tools\
	--single-instance\
	https://rauldipeas.larksuite.com/
mkdir -p\
	larkdocs/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv\
	Webapp-linux-x64\
	larkdocs/opt/larkdocs
mv\
	icon.png\
	larkdocs/usr/share/pixmaps/larkdocs.png
ELECTRON_RELEASE="$(wget -qO-\
	https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|\
	grep "DEFAULT_ELECTRON_VERSION ="|cut -d "'" -f2)"
cat <<EOF |tee larkdocs/DEBIAN/control>/dev/null
Package: larkdocs
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: amd64
Version: 0.1~electron-$ELECTRON_RELEASE
Installed-Size: $(du -s larkdocs|sed 's/ //g'|sed 's/larkdocs//g')
Homepage: https://larksuite.com
Description: Access Lark Docs on Linux.
EOF
cat <<EOF |tee larkdocs/usr/share/applications/larkdocs.desktop>/dev/null
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Lark Docs on Linux.
Name=Lark Docs
GenericName=Lark Docs desktop app
Icon=larkdocs
Exec=/opt/larkdocs/Webapp
Categories=Office
EOF
cd larkdocs
find -type f|\
	sed 's@\./@@g'|\
	grep -v DEBIAN|\
	xargs md5sum\
	>DEBIAN/md5sums
cd ..
dpkg-deb -b larkdocs .
cp\
	larkdocs*.deb\
	assets/packages/
rm -rf larkdocs*
