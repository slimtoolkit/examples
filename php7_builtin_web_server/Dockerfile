FROM php:7.0-cli
COPY src/ /usr/app
WORKDIR /usr/app

EXPOSE 1300
CMD ["php","-S","0.0.0.0:1300","./index.php"]