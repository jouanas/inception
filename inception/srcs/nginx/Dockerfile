# 1. The Base Operating System
FROM debian:bullseye

# 2. Update the package manager and install necessary software
RUN apt-get update && apt-get install -y \
    nginx \
    openssl

# 3. Create the directory for the certificates

RUN mkdir -p /etc/nginx/ssl

# 4. Generate the self-signed SSL certificate in one single command

# req -x509: Tells OpenSSL to generate a self-signed certificate instead of a standard certificate request.

# -nodes: Stands for "No DES". It tells OpenSSL not to encrypt the private key with a password. If you leave this out, NGINX will pause every time the container starts and wait for someone to type in a password, which would break your automation.
# 
# -days 365: Makes the certificate valid for one year.
# 
# -newkey rsa:2048: Generates a brand new RSA encryption key that is 2048 bits long at the same time it generates the certificate.
# 
# -keyout & -out: These tell OpenSSL exactly where to drop the generated files. Notice that these paths perfectly match the paths you wrote in your nginx.conf file earlier.
# 
# -subj: This automatically fills out the ID card for the certificate. C is Country, L is Locality, O is Organization, and most importantly, CN is the Common Name, which must strictly be your domain name (sjouan.42.fr).

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Marrakesh-Safi/L=Ben Guerir/O=1337/OU=Student/CN=sjouan.42.fr"

# 5. Copy the configuration file from the host into the container
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 6. Document which port the container will use
EXPOSE 443

# 7. The Execution Command
CMD ["nginx", "-g", "daemon off;"]