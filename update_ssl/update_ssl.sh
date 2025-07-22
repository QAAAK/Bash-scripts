#!/bin/bash

APP_PATH="/home/projects/project"
DOMAIN="project.com"

FULL_CHAIN_SRC="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"
PRIVATE_KEY_SRC="/etc/letsencrypt/live/${DOMAIN}/privkey.pem"
FULL_CHAIN_DIST="${APP_PATH}/volumes/etc/ssl/certs/project_com.full.crt"
PRIVATE_KEY_DIST="${APP_PATH}/volumes/etc/ssl/private/project_com.key"

echo "Starting script execution: $(date "+%Y-%m-%d %H:%M:%S")"

echo "Stopping the service..."
systemctl stop my-project.service

echo "Renewing the certificates..."
/usr/bin/certbot renew --standalone --quiet
/usr/bin/certbot certificates

echo "Copying the certificates to the project..."
cp -f "$FULL_CHAIN_SRC" "$FULL_CHAIN_DIST"
cp -f "$PRIVATE_KEY_SRC" "$PRIVATE_KEY_DIST"

echo "Setting correct permissions for the certificates..."
chmod 644 "$FULL_CHAIN_DIST"
chmod 644 "$PRIVATE_KEY_DIST"

echo "Running the service..."
systemctl start my-project.service

echo "End of script execution: $(date "+%Y-%m-%d %H:%M:%S")"
