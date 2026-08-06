#!/bin/bash

# 1. Start the database temporarily in the background
service mariadb start

# Wait a few seconds to ensure the daemon is fully up and listening
sleep 3

# 2. Inject the data and set permissions using .env variables
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

# 3. Safely shut down the temporary background service
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# 4. Launch the database engine in the foreground to keep the container alive
exec mysqld_safe