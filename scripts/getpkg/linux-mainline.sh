#!/bin/bash
set -e
# Linux mainline
#KERNEL_VER="$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/|grep folder|grep -v "\-rc"|tail -n2|head -n1|cut -d '"' -f8)"
#KERNEL_HEADERS_COMMON_FILE=$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER"|grep headers|grep all.deb|cut -d '"' -f2)
#KERNEL_HEADERS_FILE=$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER"|grep headers|grep amd64.deb|cut -d '"' -f2)
#KERNEL_IMAGE_FILE=$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER"|grep image|grep amd64.deb|cut -d '"' -f2)
#KERNEL_MODULES_FILE=$(wget -qO- https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER"|grep modules|grep amd64.deb|cut -d '"' -f2)
#wget -q --show-progress https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER""$KERNEL_HEADERS_COMMON_FILE"
#wget -q --show-progress https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER""$KERNEL_HEADERS_FILE"
#wget -q --show-progress https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER""$KERNEL_IMAGE_FILE"
#wget -q --show-progress https://kernel.ubuntu.com/~kernel-ppa/mainline/"$KERNEL_VER""$KERNEL_MODULES_FILE"