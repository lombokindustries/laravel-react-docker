########################################################################
### Composer

FROM composer:2.7.9 AS composer

COPY composer.json /app
COPY composer.lock /app

RUN composer install        \
    --ignore-platform-reqs  \
    --no-ansi               \
    --no-autoloader         \
    --no-interaction        \
    --no-scripts

COPY . /app/
RUN composer dump-autoload

### Composer
########################################################################
### NodeJS

FROM node:22.8.0-alpine3.19 AS node

WORKDIR /app

COPY package.json           /app
COPY package-lock.json      /app
COPY /resources             /app/resources

RUN npm install && npm run dev

### NodeJS
########################################################################
### PHP

FROM php:8.2-fpm-alpine3.19

RUN apk update && apk add --no-cache \
    libpng-dev                       \
    freetype-dev                     \
    oniguruma-dev                    \
    libxml2-dev

RUN rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*
RUN docker-php-ext-configure gd --enable-gd --with-freetype
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY . /var/www/html
COPY --from=composer /app/vendor                /var/www/html/vendor
COPY --from=node     /app/public                /var/www/html/public/
COPY --from=node     /app/mix-manifest.json     /var/www/html/mix-manifest.json


RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -S www -G www-data

COPY --chown=www:www-data . /var/www/html

WORKDIR /var/www/html

### PHP
########################################################################