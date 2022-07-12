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
    kubuntu-custom/assets/packages/
rm -rf rmtrash*