FROM php:7-fpm

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_PROCESS_TIMEOUT 3600
ARG COMPOSER_FLAGS="--prefer-dist --no-interaction"

# Install dependencies
RUN apt-get update -q \
  && apt-get install mysql-client ssh git zip wget curl make patch unzip bzip2 time libzip-dev -y --no-install-recommends

RUN docker-php-ext-install pdo_mysql

# use recommended php settings
#COPY docker/php-prod.ini /usr/local/etc/php/php.ini

# add debugger
RUN pecl channel-update pecl.php.net \
    && pecl config-set php_ini /usr/local/etc/php.ini \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug


# install composer
COPY docker/composer-install.sh /tmp/composer-install.sh
RUN chmod +x /tmp/composer-install.sh
RUN /tmp/composer-install.sh

WORKDIR /code

COPY . /code/
# run normal composer - all deps are cached already
RUN composer install $COMPOSER_FLAGS
