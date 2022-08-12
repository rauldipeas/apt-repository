#!/bin/bash
set -e
# Clockify
#aria2c --console-log-level=error --summary-interval=0\
#    "$(wget -qO-\
#    https://clockify.me/linux-time-tracking|\
#    grep .deb|cut -d '"' -f4|head -n1)"
aria2c --console-log-level=error --summary-interval=0\
    https://clockify.me/downloads/Clockify_Setup.deb