FROM alpine:latest
RUN apk update && apk add --no-cache usbutils jq
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
