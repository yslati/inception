#/bin/sh

sed -i "s/__WP_USER__/${MYSQL_USER}/g" /www/wordpress/wp-config.php
sed -i "s/__WP_PASS__/${MYSQL_PASSWORD}/g" /www/wordpress/wp-config.php

cp /www/wordpress/wp-content/plugins/redis-cache/includes/object-cache.php /www/wordpress/wp-content/object-cache.php


/usr/sbin/php-fpm7 -F -R
