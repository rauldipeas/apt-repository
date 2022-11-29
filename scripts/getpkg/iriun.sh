#!/bin/bash
set -e
# Iriun Webcam
wget -q --show-progress\
    "$(curl -sL https://iriun.com/|grep deb|cut -d '"' -f4)"