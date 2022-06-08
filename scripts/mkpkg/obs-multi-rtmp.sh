#!/bin/bash
set -e
# OBS multi RTMP #TODO
rm -rf obs-multi-rtmp
git clone -q\
	https://aur.archlinux.org/obs-multi-rtmp.git
cd obs-multi-rtmp
sudo apt install -y\
	libgbm1\
	libglapi-mesa
sudo apt install -y\
	cmake\
	libobs-dev\
	libgbm1\
	libglapi-mesa\
	qtbase5-dev
makedeb
cd ..
cp\
	obs-multi-rtmp/obs-multi-rtmp*.deb\
	assets/packages/
rm -rf obs-multi-rtmp