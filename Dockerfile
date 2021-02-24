FROM php:7.4-apache

WORKDIR /var/www/html

RUN apt-get update \
	&& apt-get install -y libpq-dev \
  && docker-php-ext-install pdo pdo_pgsql gettext \
  && rm -rf /var/lib/apt/lists/*

COPY ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["apachectl", "-D", "FOREGROUND"]