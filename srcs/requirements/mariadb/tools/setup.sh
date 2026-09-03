#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    service mariadb start 
    
    until mysqladmin ping --silent 2>/dev/null; do
        sleep 1
    done

    mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
    mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi

exec mysqld --user=mysql