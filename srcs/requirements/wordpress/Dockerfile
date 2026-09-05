FROM debian:bookworm

EXPOSE 9000

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    curl \
    mariadb-client
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY  /tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh"]
