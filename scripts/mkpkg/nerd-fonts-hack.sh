#!/bin/bash
set -e
# Nerd Fonts (LSD)
git clone -q https://aur.archlinux.org/nerd-fonts-hack.git
cd nerd-fonts-hack
makedeb
cd ..
cp nerd-fonts-hack/nerd-fonts-hack*.deb assets/packages/
rm -r nerd-fonts-hack*