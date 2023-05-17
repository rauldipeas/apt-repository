#!/bin/bash
set -e
# Slack
SLACK_VER="$(wget -qO- https://slack.com/intl/pt-br/downloads/linux|grep -o "\w*4.32.122\w*")"
wget -q --show-progress https://downloads.slack-edge.com/releases/linux/$SLACK_VER/prod/x64/slack-desktop-$SLACK_VER-amd64.deb