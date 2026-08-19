#!/usr/bin/env sh
set -e

REDIS_PASSWORD="$(grep '^requirepass' /tmp/redis.conf | awk '{print $2}')"

redis-cli --no-auth-warning -a "${REDIS_PASSWORD}" ping | grep -q PONG
