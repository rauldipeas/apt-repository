#!/bin/bash
set -e
echo 'deb [trusted=yes] https://rauldipeas.fury.site/apt/ * * #Raul Dipeas'|sudo tee /etc/apt/sources.list.d/rauldipeas.list>/dev/null
sudo apt update 2>/dev/null
