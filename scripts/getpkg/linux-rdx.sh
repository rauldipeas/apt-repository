#!/bin/bash
set -e
aria2c --console-log-level=error --summary-interval=0\
    https://nightly.link/rauldipeas/linux-rdx/workflows/linux-rdx/main/linux-rdx.zip
unzip linux-rdx.zip
rm -rf linux-libc-dev_*_amd64.deb linux-image-*-dbg_*_amd64.deb linux-rdx.zip