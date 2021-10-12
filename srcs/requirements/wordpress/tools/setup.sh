#/bin/sh

rc-service php-fmp7 restart
rc-service php-fpm7 stop
/usr/sbin/php-fpm7 -F -R
