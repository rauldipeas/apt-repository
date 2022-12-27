#!/bin/bash
set -e
# yabridge
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/robbert-vdh/yabridge/releases|grep browser_download_url|grep download|head -n2|tail -n1|cut -d '"' -f4)"
tar fxz yabridge*.tar.gz
rm -r yabridge*.tar.gz
mkdir -p yabridge/DEBIAN yabridge/usr/{bin,lib}
mv yabridge/yabridgectl yabridge/usr/bin/yabridgectl
mv yabridge/libyabridge* yabridge/usr/lib/
mv yabridge/yabridge* yabridge/usr/bin/
rm -r yabridge/README.md yabridge/CHANGELOG.md
YABRIDGE_TAG="$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/robbert-vdh/yabridge/releases|grep tag|grep -v Next|head -n1|cut -d '"' -f4|sed 's@https://github.com/robbert-vdh/yabridge/releases/tag/@@g')"
cat <<EOF |tee yabridge/DEBIAN/control>/dev/null
Package: yabridge
Version: $YABRIDGE_TAG
Depends: wine-tkg
Section: audio
Priority: optional
Architecture: amd64
Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
Description: Yet Another way to use Windows VST plugins on Linux. Yabridge seamlessly supports using both 32-bit and 64-bit Windows VST2 and VST3 plugins in a 64-bit Linux VST host as if they were native VST2 and VST3 plugins, with optional support for plugin groups to enable inter-plugin communication for VST2 plugins and quick startup times. Its modern concurrent architecture and focus on transparency allows yabridge to be both fast and highly compatible, while also staying easy to debug and maintain.
EOF
dpkg-deb -b yabridge .
mv yabridge*.deb assets/packages
rm -r yabridge*