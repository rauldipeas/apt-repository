#!/bin/bash
set -e
# Mini video me
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/maykbrito/mini-video-me/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"