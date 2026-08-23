# Developer Documentation

This document provides technical instructions for developers to set up, build, and manage the Inception stack.

## Environment Setup from Scratch
### Prerequisites
- A Virtual Machine running Debian or Alpine Linux.
- Docker and Docker Compose installed.
- `make` utility installed.

### Configuration
1. Create a `srcs/.env` file. You must define the required variables (e.g., `DOMAIN_NAME=sjouan.42.fr`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE`).
2. Set up the `/etc/hosts` file on the host machine to route `sjouan.42.fr` to `127.0.0.1`.
3. Ensure your file structure strictly matches the subject requirements (e.g., all configurations inside the `srcs` directory, Dockerfiles inside `srcs/requirements/<service>`).

## Building and Launching
The root directory contains a `Makefile` that orchestrates the `docker-compose.yml` file located in `srcs/`.
- **Build & Launch:** `make` or `make all` 
  (This executes `docker-compose -f srcs/docker-compose.yml up -d --build`).
- The `docker-compose.yml` points to the individual `Dockerfile` for each service (Nginx, MariaDB, WordPress, Adminer, Static Site) and builds them locally on the machine without pulling pre-built application images from DockerHub.

## Managing Containers and Volumes
- **View Logs:** `docker logs <container_name>` (e.g., `docker logs nginx`)
- **Access a Container Shell:** `docker exec -it <container_name> /bin/bash`
- **Restart a Single Service:** `docker restart <container_name>`
- **Inspect Networks:** `docker network inspect srcs_inception_net`
- **Prune System:** `docker system prune -a` (Use with caution; clears unused images).

## Data Storage and Persistence
All persistent data is stored using Docker named volumes mapped to the host machine's file system, bypassing container lifecycles.
- **WordPress Volume:** Data for the web files is mounted at `/home/sjouan/data/wordpress`.
- **MariaDB Volume:** Data for the database is mounted at `/home/sjouan/data/mariadb`.
If a container crashes or is rebuilt, the data remains intact in the `/home/sjouan/data` directory. To permanently delete the data, you must manually remove these directories on the host machine as `root`.
