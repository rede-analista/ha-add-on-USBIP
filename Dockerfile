ARG BUILD_FROM
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /usr/src

RUN \
    apt-get update \
    apt-get install -y usbip \
    jq

COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh"]
