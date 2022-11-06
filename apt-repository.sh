#!/bin/bash
set -e
echo 'deb [trusted=yes] https://rauldipeas.fury.site/apt/ * * #Raul Dipeas'|sudo tee /etc/apt/sources.list.d/rauldipeas.list>/dev/null
pkcon refresh 2>/dev/null