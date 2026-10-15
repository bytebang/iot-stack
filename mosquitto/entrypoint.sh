#!/bin/sh
set -e
# Passwortdatei aus Umgebungsvariablen erzeugen (bei jedem Start neu)
touch /mosquitto/data/passwd
mosquitto_passwd -b /mosquitto/data/passwd "$MQTT_USER" "$MQTT_PASSWORD"
chown mosquitto:mosquitto /mosquitto/data/passwd
chmod 0700 /mosquitto/data/passwd
exec /docker-entrypoint.sh mosquitto -c /mosquitto/config/mosquitto.conf
