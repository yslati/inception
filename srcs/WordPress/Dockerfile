FROM	alpine:3.14

RUN apk upgrade --available 


RUN apk add wget php7-common php7-fpm php7-opcache php7-session php7-mbstring php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

# RUN rc-update add php-fpm7 default && rc-service php-fpm7 start &> /dev/null

# ADD ./src/wp-config.php /www/wordpress/wp-config.php
# ADD ./src/setup.sh .
# RUN chmod +x setup.sh

# EXPOSE 9000

CMD php-fpm7 -F