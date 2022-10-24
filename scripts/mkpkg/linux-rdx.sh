#!/bin/bash
set -e
aria2c --console-log-level=error --summary-interval=0\
    https://nightly.link/rauldipeas/linux-rdx/workflows/linux-rdx/main/linux-rdx.zip
unzip linux-rdx.zip
rm -rf linux-libc-dev_*_amd64.deb linux-image-*-dbg_*_amd64.deb linux-rdx.zip
dpkg-deb -x linux-image-*-rdx_*_amd64.deb repack-image
dpkg-deb -e linux-image-*-rdx_*_amd64.deb repack-image/DEBIAN
rm linux-image-*-rdx_*_amd64.deb
sed -i "s/linux-image-.*/linux-image-rdx/g" repack-image/DEBIAN/control
dpkg-deb -b repack-image .
dpkg-deb -x linux-headers-*-rdx_*_amd64.deb repack-headers
dpkg-deb -e linux-headers-*-rdx_*_amd64.deb repack-headers/DEBIAN
rm linux-headers-*-rdx_*_amd64.deb
sed -i "s/linux-headers-.*/linux-headers-rdx/g" repack-headers/DEBIAN/control
dpkg-deb -b repack-headers .
mkdir -p meta-rdx/DEBIAN
META_VERSION=$(ls *.deb|head -n1|cut -d "_" -f2|cut -d "-" -f1)
cat <<EOF |tee meta-rdx/DEBIAN/control
Package: linux-rdx
Version: $META_VERSION-rdx-1
Architecture: amd64
Maintainer: Raul Dipeas <rauldipeas@disroot.org>
#Installed-Size: 20
Depends: linux-image-rdx (= $META_VERSION-rdx-1), linux-headers-rdx (= $META_VERSION-rdx-1)
Section: kernel
Priority: optional
Description: Vanilla Linux kernel
 Este pacote contém uma versão sem modificações do kernel Linux, apenas com patches de correções para o meu hardware pessoal.
EOF
dpkg-deb -b meta-rdx .
rm -rf meta-rdx repack-*