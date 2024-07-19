FROM debian:buster-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    bash \
    locales \
    curl \
    less \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    mariadb-client \
    redis-tools

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    php \
    php-fpm \
    php-cli \
    php-json \
    php-common \
    php-mysql \
    php-zip \
    php-gd \
    php-mbstring \
    php-curl \
    php-xml \
    php-bcmath

COPY conf/php-fpm.conf  /etc/php/7.3/fpm/php-fpm.conf
COPY conf/www.conf      /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/my.cnf        /etc/my.cnf
COPY ./tools            /root/tools/

RUN chmod +x /root/tools/*.sh

RUN ls -l /root/tools

RUN bash /root/tools/wp-setup.sh

RUN  mkdir -p /var/www/html/wordpress/42bangkok
COPY ./conf/index.html  /var/www/html/wordpress/42bangkok

STOPSIGNAL SIGQUIT

EXPOSE 9000

WORKDIR /var/www/html/wordpress

ENTRYPOINT  bash /root/tools/docker-entrypoint.sh && \
            /usr/sbin/php-fpm7.3 -F -R
