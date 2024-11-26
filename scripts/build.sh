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
#for PACKAGE in *.deb
#do
#    curl -sF "package[distro_version_id]=215" -F "package[package_file]=@$PACKAGE" https://"$PACKAGECLOUD_TOKEN":@packagecloud.io/api/v1/repos/rauldipeas/deb/packages.json
#done

# BaltoRepo
#for PACKAGE in *.deb
#do
#    curl -s --header "Authorization: Bearer $BALTOREPO_TOKEN" --form "package=@$PACKAGE" --form "distribution=all" https://rauldipeas.baltorepo.com/debian-rdx/debian-rdx/upload/
#done