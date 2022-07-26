#!/bin/bash
set -e
git clone -q\
    https://github.com/cvandesande/joplin-deb
cd joplin-deb
sudo apt install -y containerd docker.io runc
sudo gpasswd -a "$USER" docker
mkdir -pv "$HOME"/Downloads
JOPLIN_TAG="$(wget -qO- https://api.github.com/repos/laurent22/joplin/tags|\
        grep tag|head -n1|cut -d '"' -f4|sed 's@https://api.github.com/repos/laurent22/joplin/zipball/refs/tags/v@@g')"
./joplin-deb.sh "$JOPLIN_TAG"
cd ..
cp\
    "$HOME"/Downloads/joplin*.deb\
    assets/packages/
rm -rf joplin*