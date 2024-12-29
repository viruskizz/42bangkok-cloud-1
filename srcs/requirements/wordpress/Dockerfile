FROM	debian:bullseye

ARG		MYSQL_NAME
ARG		MYSQL_USERNAME_ADMIN
ARG		MYSQL_PASSWORD_ADMIN
ARG		MYSQL_HOST
ARG		WEB_TITLE
ARG		WEB_EMAIL
ARG		DOMAIN_NAME

WORKDIR /app

RUN 	apt update && apt upgrade -y
RUN		apt -y install curl \
		vim telnet \
		mariadb-client \
		redis-server \
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

RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
RUN 	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp-cli;
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN		mkdir -p /var/run/php;

# COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY	tools/wordpress_script.sh .
RUN 	chmod 777 wordpress_script.sh;

WORKDIR /var/www/wordpress

RUN 	chown -R www-data:www-data /var/www/wordpress
RUN		wp-cli core download --allow-root;

EXPOSE	9000

# ENTRYPOINT	bash /app/wordpress_script.sh && php-fpm7.3 -F -R
ENTRYPOINT	bash /app/wordpress_script.sh && php-fpm7.4 -F -R
