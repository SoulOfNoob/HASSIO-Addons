#!/usr/bin/env bash

set -e

ARCH="${ARCH:-}"

echo "[custom_install] install mongodb"
apt-get update
case "${ARCH}" in
amd64|arm64|aarch64|"")
  apt-get install --no-install-recommends -y "mongodb-server-core"
  ;;
armv7|armv7l)
  apt-get install --no-install-recommends -y "mongodb"
  ;;
*)
  echo "${ARCH}: unsupported ARCH"
  ;;
esac

echo "[custom_install] symlink for mongod"
ln -sf "$(which mongod)" "${OMADA_DIR}/bin/mongod"
chmod 755 "${OMADA_DIR}"/bin/*

echo "[custom_install]  Setup omada User Account"
groupadd -g 508 omada
useradd -u 508 -g 508 -d "${OMADA_DIR}" omada
usermod --shell /bin/bash omada