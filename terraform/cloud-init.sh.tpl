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


## Setup ENV
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

mkdir -p /usr/src/app

cat <<EOF > /home/ubuntu/.env
MYSQL_HOST=mariadb
MYSQL_DATABASE=wordpress
MYSQL_USER=admin
MYSQL_PASSWORD=admin
MYSQL_ROOT_PASSWORD=admin
WP_ADMIN=admin
WP_ADMIN_PASSWORD=admin
WP_ADMIN_EMAIL=admin@gmail.com
WP_USER=user
WP_USER_PASSWORD=user
WP_USER_EMAIL=user@gmail.com
WP_ADDRESS=localhost
WP_TITLE=wordpress
EOF