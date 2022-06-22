# https://github.com/grafana/loki/blob/main/clients/cmd/promtail/Dockerfile

FROM golang:1.17.11-bullseye as builder

# https://github.com/grafana/loki/releases
ENV LOKI_VERSION 2.5.0
WORKDIR /src/loki

RUN : \
    && set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
        libsystemd-dev \
        tree \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN : \
    && set -eux \
    && ls -alh / \
    && tree /github \
    && tree ${HOME} \
    && tree ${GITHUB_HOME} \
    && tree ${GITHUB_WORKSPACE} \
    # && curl -sfLO https://github.com/grafana/loki/archive/refs/tags/v${LOKI_VERSION}.zip \
    # && ls -alh \
    # && unzip -q v${LOKI_VERSION}.zip \
    # && ls -alh \
    # && cd loki-${LOKI_VERSION} \
    # && make clean \
    # && make BUILD_IN_CONTAINER=false promtail \
    && ls -alh \
    && :
