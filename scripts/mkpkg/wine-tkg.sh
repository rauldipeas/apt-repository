#!/bin/bash
set -e
# WINE
mkdir -p wine-tkg/{DEBIAN,etc/X11/Xsession.d,opt}
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
        https://api.github.com/repos/Kron4ek/Wine-Builds/releases|\
        grep browser_download_url|grep staging-tkg-amd64.tar.xz|head -n1|cut -d '"' -f4)"
tar -xf wine*staging-tkg-amd64.tar.xz
rm wine*staging-tkg-amd64.tar.xz
mv wine*staging-tkg-amd64 wine-tkg/opt/wine-tkg
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
        https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases|\
        grep browser_download_url|grep download|grep wine-lutris-ge|grep .tar.xz|head -n1|cut -d '"' -f4)"
tar -xf wine-lutris-ge*.tar.xz
cp lutris*/lib/wine/i386-windows/winemenubuilder.exe wine-tkg/opt/wine-tkg/lib/wine/i386-windows/winemenubuilder.exe
cp lutris*/lib64/wine/x86_64-windows/winemenubuilder.exe wine-tkg/opt/wine-tkg/lib/wine/x86_64-windows/winemenubuilder.exe
find . -name "*lutris-ge*" -print0|xargs -0 rm -r
WINE_GECKO_VER="$(wget -qO- https://dl.winehq.org/wine/wine-gecko/|grep folder|cut -d '"' -f6|sort -d|grep -v wine|tail -n1)"
wget -qO- https://dl.winehq.org/wine/wine-gecko/"$WINE_GECKO_VER"|grep x86|grep tar|grep -wv pdb|cut -d '"' -f6>wine-gecko.links
sed -i 's@wine-gecko@https://dl.winehq.org/wine/wine-gecko/wine-gecko@g' wine-gecko.links
sed -i 's@wine/wine-gecko/@'wine/wine-gecko/"$WINE_GECKO_VER"'@g' wine-gecko.links
aria2c --console-log-level=error --summary-interval=0 "$(cat<wine-gecko.links|head -n1)"
aria2c --console-log-level=error --summary-interval=0 "$(cat<wine-gecko.links|tail -n1)"
rm wine-gecko.links
WINE_MONO_VER="$(wget -qO- https://dl.winehq.org/wine/wine-mono/|grep folder|cut -d '"' -f6|sort -g|tail -n1)"
wget -qO- https://dl.winehq.org/wine/wine-mono/"$WINE_MONO_VER"|grep x86|grep tar|cut -d '"' -f6>wine-mono.links
sed -i 's@wine-mono@https://dl.winehq.org/wine/wine-mono/wine-mono@g' wine-mono.links
sed -i 's@wine/wine-mono/@'wine/wine-mono/"$WINE_MONO_VER"'@g' wine-mono.links
aria2c --console-log-level=error --summary-interval=0 "$(cat<wine-mono.links|head -n1)"
rm wine-mono.links
mkdir -p wine-tkg/opt/wine-tkg/share/wine/{gecko,mono}
tar xf wine-gecko-*-x86.tar.xz -C wine-tkg/opt/wine-tkg/share/wine/gecko/
tar xf wine-gecko-*-x86_64.tar.xz -C wine-tkg/opt/wine-tkg/share/wine/gecko/
tar xf wine-mono-*-x86.tar.xz -C wine-tkg/opt/wine-tkg/share/wine/mono/
rm -r wine-gecko-*-x86.tar.xz
rm -r wine-gecko-*-x86_64.tar.xz
rm -r wine-mono-*-x86.tar.xz
WINE_TKG_TAG="$(wget -qO- https://api.github.com/repos/Kron4ek/Wine-Builds/tags|grep name|head -n1|cut -d '"' -f4)"
cat <<EOF |tee wine-tkg/DEBIAN/control>/dev/null
Package: wine-tkg
Version: $WINE_TKG_TAG
Architecture: amd64
Maintainer: Kron4ek <kron4ek@protonmail.com>
Depends: wine
Section: x11
Priority: optional
Homepage: https://github.com/Kron4ek/Wine-Builds
Description: TkG is Wine with Staging patchset and with many additional useful patches.
EOF
cat <<EOF |tee wine-tkg/etc/X11/Xsession.d/99wine>/dev/null
if [ -d "/opt/wine-tkg/bin" ] ; then
    PATH="/opt/wine-tkg/bin:\$PATH"
fi
export WINE_ENABLE_PIPE_SYNC_FOR_APP=1
export WINEESYNC=1
export WINEFSYNC=1
EOF
dpkg-deb -b wine-tkg .
mv wine-tkg*.deb assets/packages
rm -r wine-tkg*