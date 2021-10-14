if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
        /etc/init.d/mariadb setup &>/dev/null
        rc-service mariadb start &>/dev/null
        echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
        echo "CREATE DATABASE wordpress;" | mysql -u root
        echo "GRANT ALL PRIVILEGES on *.* to '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
        echo "FLUSH PRIVILEGES;" | mysql -u root
        echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'" | mysql -u root
        echo "FLUSH PRIVILEGES;" | mysql -u root
	mysql --user="root" --database="wordpress" --password="${MYSQL_ROOT_PASSWORD}" < /wp.sql

fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop
/usr/bin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid --skip-innodb --default-storage-engine=myisam
