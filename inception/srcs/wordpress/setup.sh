#!/bin/bash

# Give MariaDB time to boot and create the database before trying to connect
sleep 10

# Only run the installation if WordPress isn't already installed
if [ ! -f /var/www/html/wp-config.php ]; then
    
    # 1. Download and install WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # 2. Navigate to the shared volume
    cd /var/www/html

    # 3. Download the core WordPress files
    wp core download --allow-root

    # 4. Create the configuration file
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost=mariadb \
        --allow-root

    # 5. Install WordPress and create the admin user
    wp core install \
        --url="https://${DOMAIN_NAME}" \
        --title="Inception" \
        --admin_user="${WP_ADMIN}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root

    # 6. Create a secondary, regular author user
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PASSWORD}" --allow-root

    # 7. Fix Permissions for NGINX to read the files (THIS IS THE FIX)
    chown -R www-data:www-data /var/www/html

fi
mkdir -p /run/php
# 8. Launch PHP-FPM in the foreground
exec /usr/sbin/php-fpm7.4 -F