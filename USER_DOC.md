# User Documentation

This document is a guide for end-users and administrators managing the Inception infrastructure.

## Services Provided
The stack provides a secure, fully containerized web environment consisting of:
- **Nginx (TLSv1.2/TLSv1.3):** The primary web server and reverse proxy handling secure connections.
- **WordPress:** A fully functional content management system for publishing.
- **MariaDB:** The backend relational database storing WordPress data.
- **Adminer:** A lightweight database management GUI.
- **Static Site:** A custom HTML resume served independently.

## Starting and Stopping the Project
- **Start:** From the root directory, run `make`. This will initialize the Docker Compose network and bring all services online in the background.
- **Stop & Clean:** Run `make fclean` to stop and remove containers, networks, and images (volumes/data will persist unless manually deleted from the host).
- *(Alternatively, if you wish to just stop containers without removing them, navigate to the `srcs` folder and run `docker-compose stop`)*.

## Accessing the Website and Administration Panel
- **Main Website:** Navigate to `https://sjouan.42.fr` in your web browser.
- **WordPress Admin:** Navigate to `https://sjouan.42.fr/wp-admin`.
- **Database Adminer:** Navigate to `https://sjouan.42.fr/adminer`.
- **Static Resume:** Navigate to `https://sjouan.42.fr/resume`.

## Locating and Managing Credentials
For security, no passwords are hardcoded. All credentials are managed securely via the `.env` file located in `srcs/.env`. 
To update passwords (such as the database root password or WordPress admin credentials), modify the `.env` file before running the `make` build command.

## Checking if Services are Running Correctly
1. Open a terminal on the host machine.
2. Run `docker ps` to verify that all containers (`nginx`, `wordpress`, `mariadb`, `adminer`, `static_site`) have an "Up" status.
3. Look at the "Ports" column to ensure only Nginx is exposing port 443 to the host machine.
