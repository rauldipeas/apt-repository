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
PACKAGECLOUD_ID="curl https://$PACKAGECLOUD_TOKEN:@packagecloud.io/api/v1/distributions.json|grep id|cut -d ' ' -f2"
for PACKAGE in *.deb
do
    #package_cloud push rauldipeas/deb/debian/bookworm "$PACKAGE"
    curl -F "package[distro_version_id]=$PACKAGECLOUD_ID" -F "package[package_file]=@$PACKAGE" https://"$PACKAGECLOUD_TOKEN":@packagecloud.io/api/v1/repos/rauldipeas/deb/packages.json
done
