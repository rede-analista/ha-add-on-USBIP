FROM homeassistant/amd64-base:latest

# Atualize os repositórios e instale os pacotes
RUN apk update && apk add --no-cache \
    usbutils \
    linux-usb \
    jq

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
