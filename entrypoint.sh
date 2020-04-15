#!/bin/sh

set -x
set -e

if [ -z "${ENV_PATH}" ]; then
  echo "You have to specify the ENV_PATH"
  exit
fi

if [ -z "${USERNAME}" ]; then
  echo "You have to specify the USERNAME"
  exit
fi
if [ -z "${PASSWORD}" ]; then
  echo "You have to specify the PASSWORD"
  exit
fi

htpasswd -cb /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

exec $(which squid) -NYCd 1
