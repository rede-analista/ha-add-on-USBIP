ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:7.3.4
FROM ${BUILD_FROM}

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils usbutils usbip jq

COPY run.sh /

RUN chmod +x /run.sh

CMD ["/run.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
