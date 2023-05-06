
#!/bin/bash
set -e
# RustDesk
wget -q --show-progress "$(wget -qO- --header="X-Auth-Token: $GITHUB_TOKEN" https://api.github.com/repos/rustdesk/rustdesk/releases|grep browser_download_url|grep deb|grep -v aarch64|grep -v armv7|grep -v armhf|head -n1|cut -d '"' -f4)"