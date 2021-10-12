FROM alpine

RUN apk upgrade --available && apk add openrc mariadb mariadb-client
RUN openrc && touch /run/openrc/softlevel

ADD tools/script.sh .

ENTRYPOINT sh script.sh
