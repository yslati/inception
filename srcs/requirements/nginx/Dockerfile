FROM	alpine:3.14


RUN apk upgrade --available && apk add nginx openrc openssl

RUN mkdir -p www
RUN chown -R root:root www

RUN openrc && touch /run/openrc/softlevel

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/setup.sh .
RUN chmod +x setup.sh

CMD sh setup.sh
