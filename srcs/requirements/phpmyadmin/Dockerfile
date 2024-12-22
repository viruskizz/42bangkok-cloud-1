FROM debian:bullseye

# ARG		PHPMY_PASSPHRASE

WORKDIR	/app

RUN 	apt update && apt upgrade -y
RUN 	apt install -y wget gpg\
		php \
		php-common \
		php-cli \
		php-fpm \
		php-json \
		php-pdo \
		php-mysql \
		php-zip \
		php-gd \
		php-mbstring \
		php-curl \
		php-xml \
		php-pear \
		php-bcmath \
		php-cgi \
		php-mysqli \
		php-phpseclib \
		php-mysql;

RUN		mkdir -p /var/run/php;
RUN		wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN		wget https://files.phpmyadmin.net/phpmyadmin.keyring
RUN		gpg --import phpmyadmin.keyring
RUN		wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz.asc
RUN		gpg --verify phpMyAdmin-latest-all-languages.tar.gz.asc
RUN		mkdir -p /var/www/phpmyadmin
RUN		tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin

# COPY 	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY 	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY	./conf/config.inc.php /var/www/phpmyadmin/

WORKDIR	/var/www/phpmyadmin

RUN		chmod 660 /var/www/phpmyadmin/config.inc.php
RUN		chown -R www-data:www-data /var/www/phpmyadmin

EXPOSE 9000
ENTRYPOINT php-fpm7.4 -F -R
# ENTRYPOINT php-fpm7.3 -F -R