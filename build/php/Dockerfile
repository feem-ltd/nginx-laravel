FROM php:7.3.15-fpm-alpine

COPY init_laravel.sh /root
# シェルスクリプトが LF でないと実行されないので、念のため LF に変換をおこなう。
RUN sed -i 's/\r//' /root/init_laravel.sh

###########################################################
# PHP の設定
###########################################################
# RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY ./my-php.ini /usr/local/etc/php/conf.d/my-php.ini


###########################################################
# モジュールのインストール
###########################################################
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add \
    curl \
    # freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    # libxml2-dev \
    # zlib-dev \
    # pcre-dev \
    g++ \
    make \
    # autoconf \
    openssl \
    nodejs-npm \
    bash \
    vim \
    git \
  && docker-php-ext-install \
    # curl \
    # dom \
    gd \
    # iconv \ # already loaded?
    # mbstring \ # already loaded?
    # pdo \
    pdo_mysql \
    # simplexml \
    # zip \
    # opcache \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && chmod +x /usr/local/bin/composer \
  && rm -rf /var/cache/apk/*