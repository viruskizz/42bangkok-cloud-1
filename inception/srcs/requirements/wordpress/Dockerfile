FROM alpine:3.16

# Install wordpress dependencies
RUN apk update && \
	apk upgrade && \
	apk add php8 php-phar php8-fpm php8-pecl-mcrypt php8-soap php8-openssl \
    php8-gmp php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli \
    php8-sqlite3 php8-apcu php8-pdo_pgsql php8-bcmath php8-gd php8-odbc \
    php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader php8-xml \
    php8-bz2 php8-iconv php8-pdo_dblib php8-curl php8-ctype php8-session \
    mariadb-client redis


RUN rm -rf  /etc/php8/php-fpm.d/*

# Copy www.conf (Listen to port 9000) to container
COPY conf/www.conf /etc/php8/php-fpm.d/default.conf
# Download && install wordpress cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

# Create wordpress directory if it doesn't exist yet
RUN mkdir -p /var/www && \
	mkdir -p /var/www/html

RUN adduser -H -D 'www' && \
	addgroup 'www' www-data

# Change working directory to wordpress directory
WORKDIR /var/www/html

# Copy wordpress container launcher
COPY tools/create_wordpress.sh /tmp/create_wordpress.sh

# Copy html contents
ADD contents /tmp/contents

EXPOSE 9000

ENTRYPOINT sh /tmp/create_wordpress.sh ; php-fpm8 -F
