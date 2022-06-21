#!/bin/bash
set -e
echo \
'deb [trusted=yes] https://rauldipeas.fury.site/apt/ * *'|\
sudo tee \
/etc/apt/sources.list.d/rauldipeas.list
sudo apt update 2>/dev/null