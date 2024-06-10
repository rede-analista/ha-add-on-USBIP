ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN \
    apt-get update \
    apt-get install -y --no-install-recommends \
    usbip \
    jq

COPY run.sh /

RUN chmod +x /run.sh

CMD ["/run.sh"]
