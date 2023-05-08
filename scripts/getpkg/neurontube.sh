#!/bin/bash
set -e
# Neurontube
wget -q --show-progress https://audiosingularity-public.us-southeast-1.linodeobjects.com/"$(wget -qO- https://audiosingularity-public.us-southeast-1.linodeobjects.com/|grep deb|cut -d '>' -f13|sed 's@</Key@@g')"