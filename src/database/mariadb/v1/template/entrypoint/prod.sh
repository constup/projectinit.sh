#!/bin/bash

echo "Setting up permissions for MariaDB configuration..."
chmod 644 /etc/mysql/conf.d/*.cnf
echo "Configuration permissions are set up... "
echo "Running docker-entrypoint.sh..."
exec docker-entrypoint.sh mariadbd