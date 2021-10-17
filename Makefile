#/bin/bash

include srcs/.env

build:
	sudo mkdir -p /home/yslati/data
	sudo mkdir -p /home/yslati/data/db
	sudo mkdir -p /home/yslati/data/wp-site
	sudo mkdir -p /home/yslati/data/backup
	sudo chown -R root:root /home/yslati/data
	sudo sh -c "echo 127.0.0.1 ${DOMAIN_NAME} >> /etc/hosts"
	cd srcs && sudo docker-compose build
up:
	cd srcs && sudo docker-compose up
down:
	cd srcs && sudo docker-compose down
