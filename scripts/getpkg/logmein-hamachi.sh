#!/bin/bash
set -e
# Logmein Hamachi
wget -q --show-progress https://vpn.net$(wget -qO- https://vpn.net/linux|grep amd64.deb|cut -d '"' -f6)