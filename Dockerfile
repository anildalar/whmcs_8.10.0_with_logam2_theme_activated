# Use the official PHP image with Apache
FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    nano \
    vim \
    cron \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    zip \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql gd zip intl opcache

# Download the latest version of IonCube Loader
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz

# Extract the downloaded file
RUN tar -zxvf ioncube_loaders_lin_x86-64.tar.gz

# Move the ionCube folder to a permanent location
RUN mv ioncube /usr/local

# Add ionCube to the PHP configuration
RUN echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_8.1.so" > /usr/local/etc/php/conf.d/00-ioncube.ini

# Clean up
RUN rm ioncube_loaders_lin_x86-64.tar.gz

# Set the Apache document root
ENV APACHE_DOCUMENT_ROOT /var/www/html

# Enable Apache mod_rewrite
RUN a2enmod rewrite

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port 80
EXPOSE 80


# Start Apache server
CMD ["apache2-foreground"]

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
