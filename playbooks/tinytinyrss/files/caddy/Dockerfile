FROM caddy:alpine

COPY Caddyfile /etc/caddy

RUN apk add --no-cache \
  ca-certificates \
  curl \
  git \
  mailcap \
  openssh-client \
  php7-fpm \
  tar \
  tzdata

# Essential PHP Extensions
RUN apk add --no-cache \
  php7-bcmath \
  php7-ctype \
  php7-curl \
  php7-dom \
  php7-exif \
  php7-fileinfo \
  php7-gd \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-mysqli \
  php7-opcache \
  php7-openssl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  php7-pgsql \
  php7-phar \
  php7-session \
  php7-simplexml \
  php7-sqlite3 \
  php7-tokenizer \
  php7-xml \
  php7-xmlreader \
  php7-xmlwriter \
  php7-zip

# Symlink php7 to php
RUN ln -sf /usr/bin/php7 /usr/bin/php

# Symlink php-fpm7 to php-fpm
RUN ln -sf /usr/bin/php-fpm7 /usr/bin/php-fpm

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["run", "--config", "/etc/caddy/Caddyfile"]
