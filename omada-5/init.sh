#!/usr/bin/with-contenv bashio

set -e
# ------------------------------------
bashio::log.info "[init] Start"
# ------------------------------------
OMADA_DIR=$1
OMADA_PERSIST=$2
# ------------------------------------
bashio::log.info "[init] Setup Omada Dir"
mkdir -p ${OMADA_PERSIST}
# ------------------------------------
bashio::log.info "[init] Setup omada persistent folder"
mkdir -p "${OMADA_PERSIST}/data/db" "${OMADA_PERSIST}/logs" "${OMADA_PERSIST}/work"
# ------------------------------------
bashio::log.info "[init] Prepare Logs"
touch ${OMADA_PERSIST}/logs/server.log
touch ${OMADA_PERSIST}/logs/mongod.log
# ------------------------------------
# bashio::log.info "[init] Set omada permissions"
chown -R omada:omada "${OMADA_PERSIST}"
# ------------------------------------
bashio::log.info "[init] Copy folder contents"
# ------------------------------------
bashio::log.info "[init] Done"