#!/bin/bash
set -e
git clone -q\
    https://github.com/cvandesande/joplin-deb
cd joplin-deb
sudo apt install -y docker.io
sudo gpasswd -a "$USER" docker
mkdir -pv "$HOME"/Downloads
JOPLIN_TAG="$(wget -qO- https://api.github.com/repos/laurent22/joplin/releases|\
	grep tag|head -n1|cut -d '"' -f4|sed 's@https://github.com/laurent22/joplin/releases/tag/@@g')"
./joplin-deb.sh "$JOPLIN_TAG"
cd ..
cp\
    "$HOME"/Downloads/joplin*.deb\
    assets/packages/
rm -rf joplin*