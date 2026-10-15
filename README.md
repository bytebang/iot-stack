# IoT-Stack: Node-RED · Grafana · InfluxDB · Mosquitto

## Start
```bash
# Passwörter/Token in .env anpassen, dann:
docker compose up -d --build
```

| Dienst    | URL / Port                  | Login (Default aus .env)        |
|-----------|-----------------------------|---------------------------------|
| Node-RED  | http://localhost:1880       | ohne (adminAuth in settings.js) |
| Grafana   | http://localhost:3000       | admin / changeme123             |
| InfluxDB  | http://localhost:8086       | admin / changeme123             |
| Mosquitto | mqtt://localhost:1883, ws://localhost:9001 | iot / changeme123 |

## Was vorkonfiguriert ist
- **InfluxDB 2.7**: Org `iot`, Bucket `sensors` (30 Tage), Admin-Token aus `.env`
- **Mosquitto**: Login-Pflicht, Benutzer aus `.env`, WebSockets auf 9001
- **Node-RED**: `node-red-contrib-influxdb` + Dashboard installiert; Demo-Flow
  publiziert alle 10 s einen Zufallswert nach `sensors/demo/temperature`,
  abonniert `sensors/#` und schreibt in InfluxDB
- **Grafana**: InfluxDB-Datasource (Flux) + Dashboard „IoT Demo“ im Ordner *IoT*

## Eigene Daten
Einfach auf `sensors/<gerät>/<messgröße>` einen Zahlenwert publizieren:
```bash
docker exec mosquitto mosquitto_pub -u iot -P changeme123 \
  -t sensors/keller/humidity -m 61.5
```
Erscheint automatisch in InfluxDB und im Grafana-Dashboard.

## Hinweise
- Node-RED kopiert `flows.json`/`settings.js` nur beim ersten Start ins Volume.
  Zum Zurücksetzen: `docker compose down && docker volume rm iot-stack_nodered-data`
- InfluxDB-Init läuft nur bei leerem Volume – `.env`-Änderungen danach greifen nicht mehr.
- Der Bucket-Name ist im Dashboard-Query fest auf `sensors` gesetzt.
