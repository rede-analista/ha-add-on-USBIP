FROM homeassistant/amd64-base:latest

# Instala apenas jq que está disponível
RUN apk update && apk add --no-cache jq

# Compila e instala o usbip manualmente
RUN apk add --no-cache gcc musl-dev linux-headers make

RUN wget http://ftp.de.debian.org/debian/pool/main/l/linux/linux-tools_5.10.92-1_amd64.deb && \
    dpkg -x linux-tools_5.10.92-1_amd64.deb / && \
    mv /usr/sbin/usbip /usr/local/bin/ && \
    rm -rf linux-tools_5.10.92-1_amd64.deb

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
