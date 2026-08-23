#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    cd /var/www/html

    wp core download --allow-root

    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url="https://${DOMAIN_NAME}" \
        --title="Inception" \
        --admin_user="${WP_ADMIN}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root

    wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PASSWORD}" --allow-root

    chown -R www-data:www-data /var/www/html

fi
mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F