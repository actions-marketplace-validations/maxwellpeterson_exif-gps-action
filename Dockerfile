FROM alpine:latest

RUN apk add exiftool

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
