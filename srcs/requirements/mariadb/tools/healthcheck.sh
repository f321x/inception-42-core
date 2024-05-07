#!/bin/bash

if mysqladmin ping -h localhost --socket=/run/mysqld/mysqld.sock 2>/dev/null; then
    echo "MariaDB socket is reachable"
    exit 0
else
    echo "Unable to reach MariaDB socket"
    exit 1
fi
