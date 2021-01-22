FROM spritsail/alpine:3.12

LABEL maintainer="Spritsail <php@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="PHP" \
      org.label-schema.url="https://github.com/spritsail/php" \
      org.label-schema.description="PHP with some additions, for Organizr" \
      org.label-schema.version="v1.0"

# PHP expects a www-data user, so set it to the same as the standard nginx container
RUN addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 && apk add --no-cache php7-zip php7-curl php7-fpm php7-sqlite3 php7-pdo_sqlite php7-session php7-json php7-simplexml php7-openssl libressl ca-certificates\
 && rm /etc/php7/php-fpm.d/*

ADD docker.conf /etc/php7/php-fpm.d/

EXPOSE 9000

CMD ["php-fpm7"]
