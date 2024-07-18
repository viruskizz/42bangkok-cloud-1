#!/bin/bash
sudo apt-get update -y
sudo apt-get install  -y \
    nginx \
    puppet-agent \
    ec2-instance-connect \
    ruby-full \
    wget

# install code deploy agent:
cd $HOME
wget https://aws-codedeploy-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
rm install

sudo systemctl enable nginx
sudo systemctl start nginx
