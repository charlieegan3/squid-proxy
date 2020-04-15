FROM alpine:3.11

RUN apk add --no-cache squid apache2-utils

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128/tcp

ENTRYPOINT ["/entrypoint.sh"]
