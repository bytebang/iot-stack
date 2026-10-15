#!/bin/bash
# Defaults nur kopieren, wenn noch keine Flows existieren -> eigene Änderungen bleiben erhalten
for f in settings.js flows.json flows_cred.json; do
  [ -f "/data/$f" ] || cp "/usr/src/node-red/defaults/$f" "/data/$f"
done
exec npm --no-update-notifier --no-fund start --cache /data/.npm -- --userDir /data
