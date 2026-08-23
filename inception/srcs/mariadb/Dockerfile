FROM debian:bullseye

EXPOSE 3306
RUN apt-get update && apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh"]