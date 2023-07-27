#!/bin/bash
set -e
# EmulationStation
sudo apt install -y\
    build-essential\
    clang-format\
    cmake\
    git\
    libasound2-dev\
    libavcodec-dev\
    libavfilter-dev\
    libavformat-dev\
    libavutil-dev\
    libcurl4-openssl-dev\
    libfreeimage-dev\
    libfreetype6-dev\
    libgit2-dev\
    libgl1-mesa-dev\
    libpoppler-cpp-dev\
    libpugixml-dev\
    libsdl2-dev
git clone -q https://gitlab.com/es-de/emulationstation-de.git
cd emulationstation-de
cmake -DAPPLICATION_UPDATER=off .
make
cpack
cd ..
mv emulationstation-de/*.deb .
rm -r emulationstation-de