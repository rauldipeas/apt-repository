#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    azure-cli\
    '^dotnet-.*'\
    firefox\
    google-chrome-stable\
    '^llvm-.*'\
    powershell\
    snapd
    #google-cloud-sdk\
sudo apt clean
sudo swapoff -a
sudo rm -r\
    "$AGENT_TOOLSDIRECTORY"\
    /opt/az\
    /usr/share/dotnet
sudo rm -r /etc/apt/sources.list.d/*.list
sudo apt install -y ruby-full
sudo gem install package_cloud
cat <<EOF |tee "$HOME"/.packagecloud
{"url":"https://packagecloud.io", "token": "$PACKAGECLOUD_TOKEN"}
EOF