#!/bin/bash
set -e
# RMTrash
git clone -q https://aur.archlinux.org/rmtrash.git
cd rmtrash
makedeb -s
cd ..
rm -r rmtrash