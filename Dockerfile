# https://github.com/grafana/loki/blob/main/clients/cmd/promtail/Dockerfile

FROM golang:1.19.4-bullseye as builder

RUN : \
    && set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libsystemd-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :
