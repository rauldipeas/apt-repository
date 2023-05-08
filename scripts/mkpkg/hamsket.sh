#!/bin/bash
set -e
# Hasmsket
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/TheGoddessInari/Hamsket/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"
dpkg-deb -x hamsket*.deb hamsket
dpkg-deb -e hamsket*.deb hamsket/DEBIAN
rm -rf hamsket*.deb
npx asar e hamsket/opt/Hamsket/resources/app.asar app-hamsket
cat <<EOF |tee -a  app-hamsket/resources/Hamsket-all.css
/**
 * Dark background
 */
.x-tab {
  background-color: #000000
}
.x-tab:hover {
  background-color: #090909
}
.x-tab-bar-body {
  background-color: #000000
}
.x-tab.x-tab-active.x-tab-default {
  border-color: white;
  background-color: #090909
}
EOF
npx asar p app-hamsket app.asar
mv app.asar hamsket/opt/Hamsket/resources/app.asar
dpkg-deb -b hamsket .
rm -rf *hamsket
