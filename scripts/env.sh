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
#sudo add-apt-repository -y ppa:kisak/kisak-mesa
echo 'deb http://ppa.launchpad.net/kisak/kisak-mesa/ubuntu jammy main'|sudo tee /etc/apt/sources.list.d/kisak-mesa.list>/dev/null
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 90935439
wget -qO- 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xeb8b81e14da65431d7504ea8f63f0f2b90935439'|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kisak-mesa.gpg>/dev/null
echo 'deb [arch=all] https://proget.hunterwittenborn.com makedeb main'|sudo tee /etc/apt/sources.list.d/makedeb.list>/dev/null
wget -qO- 'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub'|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/makedeb-archive-keyring.gpg>/dev/null
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y makedeb