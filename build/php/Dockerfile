FROM php:7.2-fpm-alpine

COPY init_laravel.sh /root
# シェルスクリプトが LF でないと実行されないので、念のため LF に変換をおこなう。
RUN sed -i 's/\r//' /root/init_laravel.sh

COPY ./php.ini /usr/local/etc/php/

# ssh2.so のインストール方法
# 参考：https://stackoverflow.com/questions/49886490/ssh2-for-php7-macos

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add \
    curl-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    zlib-dev \
    pcre-dev \
    g++ \
    make \
    autoconf \
    openssl \
    nodejs-npm \
    bash \
    vim \
    git \
    libssh2-dev \
  && pecl install ssh2-1.1.2 \
  && docker-php-ext-install \
    curl \
    dom \
    mbstring \
    pdo \
    pdo_mysql \
    simplexml \
    zip \
    opcache \
  && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
  && docker-php-ext-install gd \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && chmod +x /usr/local/bin/composer \
  && rm -rf /var/cache/apk/*