FROM	alpine

RUN apk upgrade --available 
RUN apk add php-fpm openrc wget
RUN openrc && touch /run/openrc/softlevel

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add php7 php7-fpm php7-opcache php7-session php7-mbstring
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl php7-redis

RUN mkdir -p /www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz 
RUN rm -rf latest.tar.gz && mv -Rf wordpress /www/wordpress

COPY ./conf/wp-config.php /www/wordpress/
COPY ./tools/setup.sh .
RUN chmod +x setup.sh

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/user = nobody/user = root/g'  /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/group = root/group = root/g'  /etc/php7/php-fpm.d/www.conf

CMD sh setup.sh
