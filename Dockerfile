ARG BUILD_FROM=ghcr.io/hassio-addons/ubuntu-base:8.2.0
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        usbutils \
        usbip \
        jq

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
