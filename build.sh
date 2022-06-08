#!/bin/bash
set -e
# Build
mkdir -p assets/packages
for SCRIPT in scripts/mkpkg/*.sh
do
    bash "$SCRIPT"
done
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