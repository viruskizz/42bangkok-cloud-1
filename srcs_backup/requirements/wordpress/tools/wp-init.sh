#!/bin/bash
YELLOW="\e[33m"
RESET="\e[0m"

if [ ! -f wp-config.php ]; then

  wp config create \
    --dbhost="$DB_HOST" \
    --dbname="$DB_NAME" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --force \
    --allow-root

  wp db create \
    --allow-root

  wp core install \
    --url="$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_name="$WP_ADMIN" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root
    
  wp user create \
    "$WP_USER" \
    "$WP_USER_EMAIL" \
    --role=author \
    --user_pass="$WP_USER_PASSWORD" \
    --allow-root

  wp option update siteurl "https://$WP_SITE" --allow-root
  wp option update home "https://$WP_SITE" --allow-root
  wp search-replace https://example.com https://$WP_SITE --allow-root
fi

echo $YELLOW"Wordpress Started"$RESET