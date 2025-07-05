FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git zip unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev libzip-dev \
    libcurl4-openssl-dev pkg-config libssl-dev cron nano gnupg2 \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip sockets intl soap opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html

RUN usermod -u 1000 www-data && chown -R www-data:www-data /var/www/html

EXPOSE 9000
