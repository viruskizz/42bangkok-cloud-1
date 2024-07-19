#!/bin/bash
# create html directory
mkdir -p /var
mkdir /var/www
ls -l /var/www

mkdir /var/www/html

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

## Install wordpress
wp core download --allow-root --path=/var/www/html/wordpress
