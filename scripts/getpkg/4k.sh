#!/bin/bash
set -e
# 4K
wget -qO- https://www.4kdownload.com/pt-br/downloads|grep amd64.deb|cut -d '"' -f4|cut -d '?' -f1|xargs wget -q --show-progress