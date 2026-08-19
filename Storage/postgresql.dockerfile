ARG IMAGE
FROM "${IMAGE}"

ARG POSTGRESQL_VERSION
RUN apt-get update && apt-get install -y \
    build-essential git curl \
    postgresql-common-dev \
    postgresql-server-dev-${POSTGRESQL_VERSION} \
    postgresql-${POSTGRESQL_VERSION}-cron \
    && rm -rf /var/lib/apt/lists/*