#!/bin/bash
set -e
# MEGA
#wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$(wget -qO- https://mega.nz/linux/repo/xUbuntu_22.04/amd64/|grep megasync_|grep deb|grep -v dolphin|grep -v nautilus|grep -v nemo|grep -v thunar|cut -d '"' -f8)" #megasync
#wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$(wget -qO- https://mega.nz/linux/repo/xUbuntu_22.04/amd64/|grep megasync_|grep deb|grep -v nautilus|grep -v nemo|grep -v thunar|head -n1|cut -d '"' -f8)" #dolphin
#wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$(wget -qO- https://mega.nz/linux/repo/xUbuntu_22.04/amd64/|grep megasync_|grep deb|grep -v dolphin|grep -v nemo|grep -v thunar|tail -n1|cut -d '"' -f8)" #nautilus
#wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$(wget -qO- https://mega.nz/linux/repo/xUbuntu_22.04/amd64/|grep megasync_|grep deb|grep -v dolphin|grep -v nautilus|grep -v thunar|tail -n1|cut -d '"' -f8)" #nemo
#wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$(wget -qO- https://mega.nz/linux/repo/xUbuntu_22.04/amd64/|grep megasync_|grep deb|grep -v dolphin|grep -v nautilus|grep -v nemo|tail -n1|cut -d '"' -f8)" #thunar

wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb #megasync
wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/dolphin-megasync-xUbuntu_22.04_amd64.deb #dolphin
wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nautilus-megasync-xUbuntu_22.04_amd64.deb #nautilus
wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nemo-megasync-xUbuntu_22.04_amd64.deb #nemo
wget -q --show-progress https://mega.nz/linux/repo/xUbuntu_22.04/amd64/thunar-megasync-xUbuntu_22.04_amd64.deb #thunar