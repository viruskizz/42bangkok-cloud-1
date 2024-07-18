#!/bin/bash

ADMIN_PATH="/var/www/html/wordpress/adminer"
mkdir -p $ADMIN_PATH
wget "http://www.adminer.org/latest.php" -O $ADMIN_PATH/index.php
chown -R www-data:www-data $ADMIN_PATH/index.php
chmod 755 $ADMIN_PATH/index.php
