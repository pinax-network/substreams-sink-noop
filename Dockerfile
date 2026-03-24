FROM ubuntu:24.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ca-certificates curl jq && \
    rm -rf /var/cache/apt /var/lib/apt/lists/*

ADD /substreams-sink-noop /app/substreams-sink-noop

ENV PATH "/app:$PATH"

ENTRYPOINT ["/app/substreams-sink-noop"]
