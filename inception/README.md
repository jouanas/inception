*This project has been created as part of the 42 curriculum by sjouan.*

## Description
Inception is a System Administration project that broadens system architecture knowledge by virtualizing a multi-service infrastructure using Docker. The goal is to deploy an Nginx web server, a WordPress instance running with PHP-FPM, a MariaDB database, and bonus services like Adminer and a custom static resume, all completely isolated in their own containers and connected via an internal network.

### Main Design Choices
- **Base Images:** Built from scratch using `debian:bullseye` for all containers to ensure consistency.
- **Process Management:** Services run in the foreground (e.g., `daemon off;` for Nginx) without infinite loop hacks (`tail -f`).
- **Security & Portability:** Only port 443 is exposed externally. All internal routing uses Docker's internal DNS.

### Technical Comparisons
- **Virtual Machines vs Docker:** VMs emulate entire hardware systems and run a full guest OS, which is resource-heavy. Docker containers share the host OS kernel and only virtualize the software layers, making them significantly lighter and faster to boot.
- **Secrets vs Environment Variables:** Environment variables are passed to containers at runtime (often via `.env` files) and can be exposed if the container environment is inspected. Docker Secrets mount sensitive data in memory, keeping it hidden from the container's standard environment layer. 
- **Docker Network vs Host Network:** A Docker Network isolates container traffic from the host machine and other networks, utilizing an internal DNS for service discovery. A Host Network removes this isolation, binding the container directly to the host's network interfaces, which can lead to port conflicts and security vulnerabilities.
- **Docker Volumes vs Bind Mounts:** Docker Volumes are managed natively by Docker within a dedicated storage area, persisting data independently of container lifecycles. Bind Mounts map a specific, pre-existing path on the host machine directly into the container.

## Instructions
1. Set up your domain name by adding `127.0.0.1 sjouan.42.fr` to your `/etc/hosts` file.
2. Ensure you have your `.env` file properly placed in the `srcs` directory.
3. Navigate to the root folder (where the `Makefile` is located).
4. Run `make` to build the Docker images and start the containers in detached mode.
5. Access the site via `https://sjouan.42.fr`.
6. To stop and clean up the infrastructure, run `make fclean`.

## Resources
- [Docker Official Documentation](https://docs.docker.com/)
- [Nginx Reverse Proxy Guide](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)
- [Debian Bullseye Packages](https://packages.debian.org/bullseye/)
- **AI Usage:** AI was utilized as a peer-learning assistant to clarify Nginx configuration structures in Debian, debug PHP-FPM volume mounting issues, and explore secure network architectures.
