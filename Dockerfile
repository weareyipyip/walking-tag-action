
FROM alpine:latest

RUN apk add --update --no-cache git git-lfs

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]