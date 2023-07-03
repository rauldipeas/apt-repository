#!/bin/bash
set -e
# Delta Chat
wget -q --show-progress "$(wget -qO- https://delta.chat/en/download|grep deb|cut -d '"' -f 2|head -n1)"