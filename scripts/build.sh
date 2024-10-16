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
#fury packages|sed 's/deb   /@/g'|sed 's/public//g'|sed 's/ //g'|sed 's/\*\*\*GEMFURYPACKAGES\*\*\*//g'|sed 's/namekindversionprivacy//g'|tee fury-packages>/dev/null;xargs fury yank --force <fury-packages

# Packagecloud
rm "*tonelib*"
for PACKAGE in *.deb
do
    package_cloud push rauldipeas/deb/debian/bookworm "$PACKAGE"
done