#!/bin/bash

# # Allow Remote Access
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB Server
service mysql start

# Initialize Database
mysql_secure_installation << EOF
n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
y
EOF

# add new user
cat <<EOF | mysql
USE mysql;
FLUSH PRIVILEGES;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '';
GRANT ALL ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# mysql -e "SELECT User,Password FROM mysql.user;"
