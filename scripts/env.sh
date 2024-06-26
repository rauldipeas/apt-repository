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
echo "$KISAK_MESA_GPG_KEY"|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kisak-mesa.gpg>/dev/null
#echo 'deb [arch=all] https://proget.hunterwittenborn.com makedeb main'|sudo tee /etc/apt/sources.list.d/makedeb.list>/dev/null
#wget -qO- 'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub'|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/makedeb-archive-keyring.gpg>/dev/null
#echo "$MAKEDEB_GPG_KEY"|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/makedeb.gpg>/dev/null
#sudo dpkg --add-architecture i386
#sudo apt update
#sudo apt install -y makedeb