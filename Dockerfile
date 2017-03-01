FROM alpine:3.5
MAINTAINER Marcel Maatkamp <m.maatkamp@gmail.com>

WORKDIR /projects

RUN apk update && apk upgrade && \
    apk add --update freeradius freeradius-sqlite freeradius-radclient sqlite openssl-dev && \
    chgrp radius  /usr/sbin/radiusd && chmod g+rwx /usr/sbin/radiusd && \
    rm /var/cache/apk/*

RUN find /etc/raddb/mods-enabled/*eap -exec rm {} \;

VOLUME \
    /opt/db/ \
    /etc/freeradius/certs

EXPOSE \
    1812/udp \
    1813 \
    18120

CMD ["radiusd","-xx","-f"]
