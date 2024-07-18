
# Iac

## Pupput
Puppet tool need 2 node at least
1. master node or server
2. client node that need agent

## Prequistis

Master node
```sh
#!/bin/bash
sudo apt-get update -y
apt-get install puppetserver
service puppetserver status
```

Client
```sh
#!/bin/bash
sudo apt-get update -y
sudo apt-get install puppet-agent
sudo apt-get install ec2-instance-connect
```