FROM php:8.2-apache

# Enable rewrite (optional but useful)
RUN a2enmod rewrite

# Copy your project into Apache root
COPY . /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

# Render uses dynamic PORT
ENV PORT 10000

# Replace Apache port 80 with Render PORT
RUN sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf
RUN sed -i "s/80/${PORT}/g" /etc/apache2/sites-available/000-default.conf

EXPOSE 10000

CMD ["apache2-foreground"]
