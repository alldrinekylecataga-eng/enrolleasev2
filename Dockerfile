FROM php:8.2-apache

RUN a2enmod rewrite

COPY . /var/www/html/

EXPOSE 80

ENV PORT 10000
