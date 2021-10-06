FROM php:7.3-apache-buster

RUN apt-get update && apt-get -y install \
                                  default-mysql-client \
                                    vim \
                                    wget \
                                    curl \
                                    zsh \
                                    git \
                                    libzip-dev \
                                    gnupg \
                                    libmemcached-dev \
                                    zlib1g-dev \
        && docker-php-ext-install -j$(nproc) pdo_mysql\

    && apt-get clean && rm -rf /var/lib/apt/lists/*



RUN pecl install zip-1.15.4 \
              && pecl install xdebug-2.7.1 \
              && pecl install redis \
               # && pecl install memcached-2.2.0 \
  && docker-php-ext-enable  zip xdebug redis



#Installation Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --version=1.8.5
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer


#activeer rewrite op apache
RUN a2enmod rewrite

ENV APACHE_LOG_DIR /var/log/apache2
