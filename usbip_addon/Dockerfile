FROM debian:latest

RUN apt-get update && apt-get install -y \
    usbip \
    jq \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
