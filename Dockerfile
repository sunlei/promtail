# https://github.com/grafana/loki/blob/main/clients/cmd/promtail/Dockerfile

FROM golang:1.17.11-bullseye as builder

# https://github.com/grafana/loki/releases
ENV LOKI_VERSION {{ LOKI_VERSION }}


WORKDIR /src/loki

RUN : \
    && set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libsystemd-dev \
    && :

RUN : \
    && set -ex \
    && curl -sfLO -o loki.zip https://github.com/grafana/loki/archive/refs/tags/v${LOKI_VERSION}.zip \
    && unzip -q loki.zip \
    && cd loki-${LOKI_VERSION} \
    && make clean \
    && make BUILD_IN_CONTAINER=false promtail \
    && ls -alh \
    && :
