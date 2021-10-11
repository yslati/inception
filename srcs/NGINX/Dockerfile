FROM	alpine:3.14


RUN apk upgrade --available && apk add nginx openrc openssl
RUN adduser -D -g 'www' www &&\
	mkdir /www &&\
	chown -R www:www /var/lib/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"
RUN rc-status && mkdir /run/openrc/softlevel

ADD ./src/nginx.conf /etc/nginx/nginx.conf
COPY ./src/index.html /www/

EXPOSE 443 80

ENTRYPOINT nginx -g 'daemon off;'