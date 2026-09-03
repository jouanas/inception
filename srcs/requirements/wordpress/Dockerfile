FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    mariadb-client
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY  /tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh"]
