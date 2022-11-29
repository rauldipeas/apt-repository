#!/bin/bash
set -e
# Morgen
wget -q --show-progress\
    "$(wget -qO- https://www.morgen.so/onboarding/download|grep deb|cut -d '"' -f82)"