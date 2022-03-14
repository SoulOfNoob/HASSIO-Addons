#!/usr/bin/with-contenv bashio

set -e
# ------------------------------------
bashio::log.info "[fixpermissions] Start"
# ------------------------------------
chmod 755 /etc
chmod 755 /usr
chmod 755 /usr/bin
# ------------------------------------
bashio::log.info "[fixpermissions] Done"