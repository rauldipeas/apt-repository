#!/bin/bash
set -e
# Slack
SLACK_VER="$(wget -qO- https://slack.com/intl/pt-br/downloads/linux|grep -o "Versão *.*"|cut -d '<' -f1|sed 's/Versão //g')"
wget -q --show-progress https://downloads.slack-edge.com/releases/linux/$SLACK_VER/prod/x64/slack-desktop-$SLACK_VER-amd64.deb