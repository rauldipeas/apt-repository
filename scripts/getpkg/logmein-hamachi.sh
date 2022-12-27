#!/bin/bash
set -e
# Logmein Hamachi
wget -q --show-progress https://www.vpn.net$(wget -qO- https://www.vpn.net/linux|grep amd64.deb|cut -d '"' -f6)