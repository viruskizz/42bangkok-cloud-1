#!/bin/bash

# * install mariadb server ;
apt-get update && apt-get -y upgrade;
apt-get install -y mariadb-server;
# * remove bind-address in /etc/mysql/mariadb.conf.d/50-server.cnf ;
sed -i '/bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf;
# * start mysql service for setting ;
# service mysql start;
service mariadb start;
# * set secure mairadb installation with setting root password ;
mysql_secure_installation << EOF

n
y
$MYSQL_ROOTPASS
$MYSQL_ROOTPASS
y
y
y
y
EOF
# y
# $MYSQL_ROOTPASS
# $MYSQL_ROOTPASS
# y
# n
# y
# y
EOF
# * create database and user for mysql from environment;
mysql -Bse "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;";
mysql -Bse "CREATE USER IF NOT EXISTS $MYSQL_USERNAME_ADMIN@'%' IDENTIFIED BY '$MYSQL_PASSWORD_ADMIN';";
mysql -Bse "GRANT ALL PRIVILEGES ON *.* TO $MYSQL_USERNAME_ADMIN@'%' IDENTIFIED BY '$MYSQL_PASSWORD_ADMIN';";
mysql -Bse "FLUSH PRIVILEGES;";
mysql -Bse "CREATE USER IF NOT EXISTS $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
mysql -Bse "GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
mysql -Bse "FLUSH PRIVILEGES;";
