# Use the official PHP image with Apache
FROM php:7.4-apache

# Set the ServerName to localhost to suppress the warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Allow access to the document root
RUN echo "<Directory /var/www/html/> \
    Options Indexes FollowSymLinks \
    AllowOverride None \
    Require all granted \
</Directory>" >> /etc/apache2/apache2.conf

# Copy the PHP app files into the container's Apache directory
COPY . /var/www/html/

# Set file permissions (optional but recommended)
RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

# Expose port 80 to allow web traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

