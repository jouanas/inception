# 1. The Base Operating System
FROM debian:bullseye

# 2. Update the package manager and install necessary software
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    mariadb-client

# 3. Copy the configuration file from the host into the container
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

# 4. Copy the setup script into the container and make it executable
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# 5. Document which port the container will use
EXPOSE 9000

# 6. The Execution Command
CMD ["/setup.sh"]