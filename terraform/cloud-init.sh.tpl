#!/bin/bash
sudo apt-get update -y
sudo apt-get install  -y \
    make \
    ec2-instance-connect \
    ruby-full \
    wget

# install code deploy agent:
cd $HOME
wget https://aws-codedeploy-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
rm install

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

service docker start
usermod -a -G docker ubuntu
chkconfig docker on

## Setup ENV

cat <<EOF > /home/ubuntu/.env
#Mariadb
MYSQL_ROOT_PASSWORD=${db_password}
MYSQL_USER=admin
MYSQL_PASSWORD=${db_password}

#Wordpress
WP_SCHEME=http
WP_PORT=80
DB_HOST=db
DB_NAME=wordpress
WP_TITLE=wordpress
WP_ADMIN=admin
WP_ADMIN_PASSWORD=${db_password}
WP_ADMIN_EMAIL=admin@example.com
WP_USER=araiva
WP_USER_EMAIL=araiva@example.com
WP_USER_PASSWORD=${db_password}
WP_SITE=${wp_site}
DOMAIN_NAME=localhost

# # * name of database container normaly be mariadb
# MYSQL_HOST=mariadb
# # * name of database for wordpress
# MYSQL_NAME=wordpress
# # * root password for mariadb
# MYSQL_ROOTPASS=admin
# # * admin account for mariadb, wordpress-admin
# MYSQL_USERNAME_ADMIN=admin
# MYSQL_PASSWORD_ADMIN=${db_password}
# # * user account for mariadb
# MYSQL_USERNAME=user
# MYSQL_PASSWORD=${db_password}
# # * domian name
# DOMAIN_NAME=${wp_site}
# # * title for wordpress
# WEB_TITLE=cloud1
# # * email for wordpress-admin
# WEB_EMAIL=araiva@example.com


EOF

make init