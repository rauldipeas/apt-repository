#!/bin/bash
set -e
# cpufreq
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/konkor/cpufreq/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"