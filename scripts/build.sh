#!/bin/bash
set -e
# Build
for SCRIPT in scripts/mkpkg/*.sh
do
    bash -x "$SCRIPT"
done
for SCRIPT in scripts/getpkg/*.sh
do
    bash -x "$SCRIPT"
done

# GemFury
for PACKAGE in *.deb
do
    curl -sF package=@"$PACKAGE" https://"$GEMFURY_PUSH_TOKEN"@push.fury.io/rauldipeas/
done