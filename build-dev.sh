#!/bin/bash
set -e
# Build
mkdir -p assets/packages

bash scripts/mkpkg/obs-multi-rtmp.sh

for SCRIPT in scripts/getpkg/*.sh
do
    bash "$SCRIPT"
done
mv ./*.deb assets/packages

# GemFury
for PACKAGE in assets/packages/*.deb
do
    curl -F\
        package=@"$PACKAGE"\
        https://"$GEMFURY_PUSH_TOKEN"@push.fury.io/rauldipeas/
done