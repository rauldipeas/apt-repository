#!/bin/bash
set -e
# Ananicy
git clone -q https://github.com/Nefelim4ag/Ananicy.git
./Ananicy/package.sh debian
mv Ananicy/ananicy-*.deb .
rm -r Ananicy