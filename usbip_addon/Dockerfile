FROM homeassistant/amd64-base:latest

RUN apk add --no-cache \
  usbip \
  jq

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

