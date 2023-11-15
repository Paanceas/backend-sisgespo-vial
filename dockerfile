FROM php:7.4-apache

# Instalar extensiones de PHP
RUN docker-php-ext-install pdo pdo_mysql

# Establecer ServerName para Apache
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf