#!/usr/bin/env zsh
# https://superuser.com/a/1676511
# stop microsoft auto-updater from popping up

# check current config
plutil -p /Library/LaunchAgents/com.microsoft.update.agent.plist

# apply new values
sudo plutil -replace Disabled -integer 1 /Library/LaunchAgents/com.microsoft.update.agent.plist
sudo plutil -replace RunAtLoad -integer 0 /Library/LaunchAgents/com.microsoft.update.agent.plist
sudo plutil -replace StartInterval -integer 10368000 /Library/LaunchAgents/com.microsoft.update.agent.plist

# check new config
plutil -p /Library/LaunchAgents/com.microsoft.update.agent.plist