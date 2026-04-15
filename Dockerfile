FROM php:8.2-apache

# Install MySQL PDO driver (IMPORTANT FIX)
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache rewrite (optional but common)
RUN a2enmod rewrite

# Copy project
COPY . /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

# Render port
ENV PORT 10000

RUN sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf
RUN sed -i "s/80/${PORT}/g" /etc/apache2/sites-available/000-default.conf

EXPOSE 10000

CMD ["apache2-foreground"]
