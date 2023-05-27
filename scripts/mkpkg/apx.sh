#!/bin/bash
set -e
# apx
sudo apt install -y\
    debhelper\
    devscripts\
    dh-golang\
    golang-go
git clone -q --recursive https://github.com/Vanilla-OS/apx.git
cd apx
make build
dpkg-buildpackage -b -us -uc
cd ..
rm -r apx