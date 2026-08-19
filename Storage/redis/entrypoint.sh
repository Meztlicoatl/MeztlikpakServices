#!/usr/bin/env sh
set -e

CONF_TEMPLATE="/etc/redis/redis.conf.template"
CONF_OUTPUT="/tmp/redis.conf"

# shellcheck disable=SC2016
envsubst '${REDIS_PASSWORD} ${REDIS_MAX_MEMORY}' \
    < "${CONF_TEMPLATE}" \
    > "${CONF_OUTPUT}"

exec redis-server "${CONF_OUTPUT}"
