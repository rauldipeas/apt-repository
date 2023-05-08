#!/bin/bash
set -e
# OBS multi RTMP #TODO
git clone -q https://aur.archlinux.org/obs-multi-rtmp.git
cd obs-multi-rtmp
sudo apt install -y cmake libobs-dev qtbase5-dev
makedeb -d
cd ..
#cp obs-multi-rtmp/obs-multi-rtmp*.deb assets/packages/
cp obs-multi-rtmp/obs-multi-rtmp*.deb .
rm -r obs-multi-rtmp