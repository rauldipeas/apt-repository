#!/bin/bash
set -e
rm -f /etc/apt/sources.list.d/rauldipeas.list
cat <<EOF |sudo tee /etc/apt/sources.list.d/rauldipeas.sources>/dev/null
X-Repolib-Name: Raul Dipeas
Enabled: yes
Types: deb
URIs: https://apt.rauldipeas.com.br
Suites: *
Components: *
Trusted: yes
EOF
if [ -f /usr/bin/nala ];then
  sudo nala update
  else
  sudo apt -qq update
fi
