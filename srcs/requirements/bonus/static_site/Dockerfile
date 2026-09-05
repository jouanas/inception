FROM debian:bookworm

EXPOSE 3000

RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /var/www/html/resume

RUN rm -rf /etc/nginx/sites-enabled/default

COPY index.html /var/www/html/resume/index.html
COPY static.conf /etc/nginx/conf.d/static.conf


CMD ["nginx", "-g", "daemon off;"]

