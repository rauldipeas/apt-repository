#!/bin/bash
set -e
# Anytype
wget -q --show-progress --content-disposition https://download.anytype.io/"$(wget -qO- https://download.anytype.io/|grep Debian|cut -d '"' -f2)"