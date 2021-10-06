# Choose and name our temporary image.
FROM php:7.3-cli-alpine

ARG GIT_TOKEN

###
### Install python3 and ansible + PyMysql extension
###
RUN apk update \
    && apk add --update --no-cache python3 \
    && ln -sf python3 /usr/bin/python \
    && apk add --no-cache ansible \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && pip3 install PyMysql



###
### Install composer (1 and 2)
###
RUN set -eux \
    && curl -sS -L --fail https://getcomposer.org/composer-1.phar > /usr/local/bin/composer-1 \
    && curl -sS -L --fail https://getcomposer.org/composer-2.phar > /usr/local/bin/composer-2 \
    && chmod +x /usr/local/bin/composer-1 \
    && chmod +x /usr/local/bin/composer-2 \
    && ln -sf /usr/local/bin/composer-2 /usr/local/bin/composer


###
### Install dependencies required to git clone.
### git clone the oweval repo
###
RUN apk update \
    && apk add --update git \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
    && git clone --verbose https://token:${GIT_TOKEN}@git.repo.vub.ac.be/jevdheyd/oweval.git


###
### Install php packages
###
RUN apk update  \
    && apk add --no-cache $PHPIZE_DEPS libzip libzip-dev zip \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip  pdo_mysql\
    && docker-php-ext-enable pdo_mysql


COPY ./data/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["sh","/docker-entrypoint.sh"]
