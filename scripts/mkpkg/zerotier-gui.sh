#!/bin/bash
set -e
# ZeriTier GUI
git clone -q\
    https://github.com/tralph3/ZeroTier-GUI
cd ZeroTier-GUI
./make_deb.sh
de ..
cp \
    ZeroTier-GUI/packaging/ZeroTier-GUI.deb\
    assets/packages/
rm -rf ZeroTier-GUI*