# 1. The Base Operating System
FROM debian:bullseye

# 2. Update the package manager and install necessary software
RUN apt-get update && apt-get install -y mariadb-server

# 3. Copy the configuration file from the host into the container
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# 4. Copy the setup script into the container and make it executable
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# 5. Document which port the container will use
EXPOSE 3306

# 6. The Execution Command
CMD ["/setup.sh"]