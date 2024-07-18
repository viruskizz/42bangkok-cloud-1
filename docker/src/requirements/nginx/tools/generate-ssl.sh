#!/bin/bash
# https://www.baeldung.com/openssl-self-signed-cert
echo $DOMAIN_NAME

openssl dhparam \
    -out /etc/nginx/dhparam.pem 2048

openssl genrsa \
    -out /etc/ssl/certs/private.key 2048

openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/certs/private.key \
    -out /etc/ssl/certs/cert.crt \
	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=Crocodile/CN=$DOMAIN_NAME"
