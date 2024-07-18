# Connect to DB
echo "mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --port=3306 $MYSQL_NAME;"
while ! mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --port=3306 $MYSQL_NAME; do
	echo "Try to reconnect to mariadb-server";
	sleep 10;
done
echo "Connected to mariadb-server"

# Check if wordpress is already exist
if [ ! -f wp-config.php ]; then
	wp core download
	wp config create --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root --dbhost=$MYSQL_HOST --dbname=$MYSQL_DATABASE
	# wp install
	echo wp core install --url=$WP_ADDRESS --title=$WP_TITLE --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp core install --url=$WP_ADDRESS --title=$WP_TITLE --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --quiet
	# wp theme
	wp theme install neve --activate --force --path="/var/www/html"
	# # Set up wp config for redis
	echo "Setting up redis connection ..."
	sed -i "21i define( 'WP_REDIS_HOST', 'redis' );" wp-config.php
	sed -i "22i define( 'WP_REDIS_PORT', '6379' );" wp-config.php
	# sed -i "23i define( 'WP_REDIS_PASSWORD', '$REDIS_PASS' );" wp-config.php
	# Install redis plugin
	echo "Installing Redis Plugin ..."
	wp plugin install redis-cache --activate --allow-root --quiet
	# Enable redis plugin
	echo "Enabling Redis Plugin ..."
	wp redis enable --allow-root --quiet
	wp redis status | grep Status
	# Move html content
	mv /tmp/contents /var/www/html/static
	mv /var/www/html/static/index.html /var/www/html/index.html
	echo "Finishing WP setup ..."
fi

chown -R www:www-data /var/www/html

# Create socket directory
if [ ! -d /run/php ]; then
	mkdir -p /run
	mkdir -p /run/php
fi
