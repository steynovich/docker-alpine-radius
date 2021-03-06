FROM alpine:3.5
MAINTAINER Marcel Maatkamp <m.maatkamp@gmail.com>

WORKDIR /projects

RUN apk add --no-cache --virtual .freeradius-rundeps \
	freeradius \
	freeradius-sqlite \
	freeradius-radclient \
	sqlite

RUN find /etc/raddb/mods-enabled/*eap -exec rm {} \;

VOLUME \
    /opt/db/ \
    /etc/freeradius/certs

EXPOSE \
    1812/udp \
    1813 \
    18120

CMD ["radiusd","-xx","-f"]
