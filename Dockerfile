FROM php:7.3-fpm

RUN apt-get update \
    && apt-get install -y -q wget git libzip-dev libpng-dev \
    && docker-php-ext-install pdo zip gd \
    && docker-php-ext-install pdo_mysql \
    && wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony/bin/symfony /usr/bin/symfony \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www