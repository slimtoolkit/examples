FROM php:7-fpm

RUN apt-get update -y && apt-get install -y nginx

COPY nginx-site.conf /etc/nginx/sites-enabled/site.conf
COPY src/ /var/www
COPY entrypoint.sh /opt/entrypoint.sh

EXPOSE 1300

CMD ["sh", "/opt/entrypoint.sh"]
