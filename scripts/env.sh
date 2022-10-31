#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    azure-cli\
    '^dotnet-.*'\
    firefox\
    google-chrome-stable\
    google-cloud-sdk\
    '^llvm-.*'\
    powershell\
    snapd
sudo apt clean
sudo swapoff -a
sudo rm -r\
    "$AGENT_TOOLSDIRECTORY"\
    /opt/az\
    /usr/share/dotnet
sudo rm -r /etc/apt/sources.list.d/*.list
sudo add-apt-repository -y ppa:kisak/kisak-mesa
echo 'deb [arch=all] https://proget.hunterwittenborn.com makedeb main'|sudo tee /etc/apt/sources.list.d/makedeb.list>/dev/null
wget -qO- 'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub'|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/makedeb-archive-keyring.gpg>/dev/null
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y makedeb