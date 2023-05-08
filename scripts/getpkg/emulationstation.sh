#!/bin/bash
set -e
# EmulationStation
wget -q --show-progress -O emulationstation-de_x64.deb $(wget -qO- https://es-de.org|grep x64.deb|head -n1|cut -d '=' -f4|cut -d '>' -f1)