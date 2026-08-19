ARG IMAGE
FROM "${IMAGE}"

RUN if command -v apt-get > /dev/null 2>&1; then \
    apt-get update && apt-get install -y --no-install-recommends gettext-base \
    && rm -rf /var/lib/apt/lists/*; \
elif command -v apk > /dev/null 2>&1; then \
    apk add --no-cache gettext; \
fi

COPY redis/redis.conf.template /etc/redis/redis.conf.template
COPY redis/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY redis/healthcheck.sh /usr/local/bin/healthcheck.sh

RUN chmod +x /usr/local/bin/entrypoint.sh \
    /usr/local/bin/healthcheck.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]