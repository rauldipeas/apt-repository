#!/bin/bash
set -e
# RMTrash
rm -rf rmtrash*
git clone -q\
    https://aur.archlinux.org/rmtrash.git
cd rmtrash
makedeb -s
cd ..
cp\
    rmtrash/rmtrash*.deb\
    assets/packages/
rm -rf rmtrash*