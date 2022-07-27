#!/bin/bash
set -e
# ClickUp #TODO
git clone -q\
    https://aur.archlinux.org/clickup.git
cd clickup
sed -i\
    "s/depends=('gtk3' 'libindicator-gtk2' 'dbus-glib' 'alsa-lib' 'libdbusmenu-gtk2' 'nss')//g"\
    PKGBUILD
makedeb -d #-H 'Section: office'
cd ..
cp\
    clickup/clickup*.deb\
    assets/packages/
rm -rf clickup*