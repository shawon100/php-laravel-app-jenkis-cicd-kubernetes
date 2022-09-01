FROM php:7.4-cli

RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app
# Install unzip utility and libs needed by zip PHP extension 
RUN apt install zip unzip php5.6-zip

RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000