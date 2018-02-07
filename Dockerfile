FROM php:7.2

# install inzip and git - both needed by composer
RUN apt-get update && apt-get -y install unzip git && apt-get autoremove -y && apt-get clean all

# Install XDebug for code coverage
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Install PHPUnit 6
RUN curl -O -L -sS  https://phar.phpunit.de/phpunit-6.phar \
    && mv phpunit-6.phar /usr/local/bin/phpunit \
    && chmod +x /usr/local/bin/phpunit