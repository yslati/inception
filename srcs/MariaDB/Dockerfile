FROM alpine

RUN apk upgrade --available && apk add openrc mariadb mariadb-client
RUN openrc && touch /run/openrc/softlevel

ADD src/setup.sh .
RUN script

ENTRYPOINT sh setup.sh