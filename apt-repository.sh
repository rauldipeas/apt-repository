#!/bin/bash
set -e
rm -f /etc/apt/sources.list.d/rauldipeas.list
cat <<EOF |sudo tee /etc/apt/sources.list.d/rauldipeas.sources>/dev/null
X-Repolib-Name: Raul Dipeas
Enabled: yes
Types: deb
URIs: https://rauldipeas.fury.site/apt
Suites: *
Components: *
Trusted: yes
EOF
pkcon refresh 2>/dev/null