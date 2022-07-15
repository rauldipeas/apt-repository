#!/bin/bash
set -e
# Morgen
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO- https://www.morgen.so/onboarding/download|grep deb|cut -d '"' -f82)"