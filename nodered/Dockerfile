FROM nodered/node-red:latest

# Zusatz-Nodes vorinstallieren
RUN npm install --no-audit --no-fund \
      node-red-contrib-influxdb \
      node-red-dashboard

# Vorkonfiguration: wird nur beim ersten Start nach /data kopiert (Volume leer)
COPY --chown=node-red:node-red settings.js flows.json flows_cred.json /usr/src/node-red/defaults/
COPY --chown=node-red:node-red init.sh /usr/src/node-red/init.sh

ENTRYPOINT ["/bin/bash", "/usr/src/node-red/init.sh"]
