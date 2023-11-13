#!/bin/bash
set -e
# Fluent reader
git clone -q https://aur.archlinux.org/fluent-reader-bin
cd fluent-reader-bin
#sed -i 's/depends/#depends/g' PKGBUILD
sed -i 's/-bin//g' PKGBUILD
sed 14,37d PKGBUILD>PKGBUILD
makedeb
cd ..
mv fluent-reader-bin/fluent-reader*.deb .
rm -rf fluent-reader-bin