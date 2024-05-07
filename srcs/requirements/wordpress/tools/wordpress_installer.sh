#!/bin/bash

# https://make.wordpress.org/cli/handbook/guides/installing/
cd /var/www/html && wget -O wpcli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wpcli.phar

# download
./wpcli.phar core download --allow-root

# connect to db / create config
./wpcli.phar config create --dbname=$DB_NAME --dbuser=$(cat /run/secrets/db_username) --dbpass=$(cat /run/secrets/db_password) --dbhost=mariadb --allow-root

# install
./wpcli.phar core install --url=$DOMAIN_NAME --title=inception --admin_user=$(cat /run/secrets/wp_admin_usr) --admin_password=$(cat /run/secrets/wp_admin_password) --admin_email=e@mail.com --allow-root

# add user
./wpcli.phar user create $(cat /run/secrets/wp_username) user@42abc.com --role=author --user_pass=$(cat /run/secrets/wp_user_password) --allow-root

# give permissions to www-data user for image upload
chown -R www-data:www-data /var/www/html

exec php-fpm8.2 -F
