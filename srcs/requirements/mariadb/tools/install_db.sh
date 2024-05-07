#!/bin/bash

# Replace placeholders with environment variable values
export DB_USERNAME=$(cat /run/secrets/db_username)
export DB_PASSWORD=$(cat /run/secrets/db_password)
envsubst < /etc/mysql/init_script.sql > /etc/mysql/init_script.sql.temp && cp -f /etc/mysql/init_script.sql.temp /etc/mysql/init_script.sql

mysql_install_db
exec mysqld
