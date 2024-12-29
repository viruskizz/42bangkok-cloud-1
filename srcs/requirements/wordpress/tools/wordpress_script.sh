#!/bin/bash

# * looping util mariadb container finished setting up ;
mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN &> /dev/null
while [ $? -eq 1 ]; do
	mysql -u $MYSQL_USERNAME_ADMIN -p$MYSQL_PASSWORD_ADMIN &> /dev/null
done
# * checke is config exist;
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	# * create config file for wordpress to passing thought wordpress website ;
	wp-cli config create \
		--dbname=$MYSQL_NAME \
		--dbuser=$MYSQL_USERNAME_ADMIN \
		--dbpass=$MYSQL_PASSWORD_ADMIN \
		--dbhost=$MYSQL_HOST \
		--allow-root;
	wp-cli core install \
		--url=$DOMAIN_NAME \
		--title=$WEB_TITLE \
		--admin_user=$MYSQL_USERNAME_ADMIN \
		--admin_password=$MYSQL_PASSWORD_ADMIN \
		--admin_email=$WEB_EMAIL \
		--allow-root;
	wp option update siteurl "https://$DOMAIN_NAME" --allow-root
  	wp option update home "https://$DOMAIN_NAME" --allow-root
	wp-cli theme install twentytwentyfour --activate --allow-root
fi
