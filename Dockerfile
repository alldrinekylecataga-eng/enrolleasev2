FROM php:8.2-apache

# Install PDO MySQL driver (THIS FIXES YOUR ERROR)
RUN docker-php-ext-install pdo pdo_mysql

# Enable rewrite (optional)
RUN a2enmod rewrite

# Copy project
COPY . /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
