FROM alpine

RUN apk upgrade --available && apk add openrc mariadb mariadb-client
RUN openrc && touch /run/openrc/softlevel

COPY tools/script.sh .
COPY ./conf/wp.sql .

ENTRYPOINT sh script.sh
