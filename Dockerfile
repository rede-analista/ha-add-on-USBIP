ARG BUILD_FROM=debian:12.5-slim
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update \
    apt-get install -y --no-install-recommends \
    usbip \
    jq

COPY run.sh /

RUN chmod +x /run.sh

CMD ["/run.sh"]
