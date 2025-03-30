#!/bin/bash
DB_HOST="localhost"
DB_USER="root"
DB_PASS="password"
if mysqladmin ping -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" --silent; then
    echo "Database is running"
else
    echo "Database is DOWN! Investigate immediately."
fi
