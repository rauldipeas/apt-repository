#!/bin/bash
set -e
# Blue Mail
rm -rf BlueMail*.deb
aria2c --console-log-level=error --summary-interval=0\
	https://download.bluemail.me/BlueMail/deb/BlueMail.deb