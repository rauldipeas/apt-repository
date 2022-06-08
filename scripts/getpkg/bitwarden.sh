#!/bin/bash
set -e
# Bitwarden
rm -rf Bitwarden*.deb
aria2c --console-log-level=error --summary-interval=0\
    'https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb'