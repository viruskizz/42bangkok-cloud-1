#!/bin/bash

sed -i 's/MYSQL_USER/'"$MYSQL_USER"'/' /etc/my.cnf
sed -i 's/MYSQL_PASSWORD/'"$MYSQL_PASSWORD"'/' /etc/my.cnf
sed -i 's/DB_HOST/'"$DB_HOST"'/' /etc/my.cnf
sed -i 's/# default-authentication-plugin=mysql_native_password/'"default-authentication-plugin=mysql_native_password"'/' /etc/my.cnf
