#!/bin/bash
set -e
# Nerd Fonts(LSD)
rm -rf nerd-fonts-hack*
git clone -q\
	https://aur.archlinux.org/nerd-fonts-hack.git
cd nerd-fonts-hack
makedeb
cd ..
cp\
    nerd-fonts-hack/nerd-fonts-hack*.deb\
    assets/packages/
rm -rf nerd-fonts-hack*