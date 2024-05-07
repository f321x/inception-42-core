#!/bin/bash

envsubst < /etc/nginx/sites-available/default > /etc/nginx/sites-available/default.temp && cp -f /etc/nginx/sites-available/default.temp /etc/nginx/sites-available/default

openssl req -x509 -newkey rsa:4096 -keyout "$DOMAIN_NAME.key" -out "$DOMAIN_NAME.crt" -sha256 -days 3650 -nodes -subj "/C=XX/ST=envcity/L=anoncity/O=42/OU=Cluster2/CN=$DOMAIN_NAME"

exec nginx -g 'daemon off;'
