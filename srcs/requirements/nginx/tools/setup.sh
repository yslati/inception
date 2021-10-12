#!/bin/sh
rc-service nginx restart
rc-service nginx stop
/usr/sbin/nginx -g 'daemon off;'
