#!/bin/bash
set -e
# ToneLib
rm -rf ToneLib*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://tonelib.net/downloads.html|\
	grep amd64.deb|grep Bass|cut -d '"' -f28)"
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://tonelib.net/downloads.html|\
	grep amd64.deb|grep TubeWarmth|cut -d '"' -f28)"
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://tonelib.net/downloads.html|\
	grep amd64.deb|grep Zoom|cut -d '"' -f20)"
aria2c --console-log-level=error --summary-interval=0\
	https://plugins4free.com/get_plug/ToneLib-GFX-amd64.deb