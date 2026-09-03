FROM debian:bullseye

EXPOSE 9001

RUN mkdir -p /run/php
RUN mkdir -p /var/www/adminer

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    wget \
    mariadb-client

RUN wget "http://www.adminer.org/latest.php" -O /var/www/adminer/index.php
RUN chown -R www-data:www-data /var/www/adminer

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf


CMD ["/usr/sbin/php-fpm7.4", "-F"]