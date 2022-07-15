#!/bin/bash
set -e
# ToneLib
aria2c --console-log-level=error --summary-interval=0\
	https://tonelib.net/download/ToneLib-BassDrive-amd64.deb
aria2c --console-log-level=error --summary-interval=0\
	https://tonelib.net/download/ToneLib-TubeWarmth-amd64.deb
aria2c --console-log-level=error --summary-interval=0\
	https://tonelib.net/download/ToneLib-Zoom-amd64.deb
aria2c --console-log-level=error --summary-interval=0\
	https://plugins4free.com/get_plug/ToneLib-GFX-amd64.deb