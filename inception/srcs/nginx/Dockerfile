FROM debian:bullseye
EXPOSE 443

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Marrakesh-Safi/L=Ben Guerir/O=1337/OU=Student/CN=sjouan.42.fr"

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]