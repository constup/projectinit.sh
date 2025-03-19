#!/bin/bash

echo "Setting up permissions for Percona configuration..."
chmod 644 /etc/my.cnf.d/*.cnf
echo "Configuration permissions are set up... "
echo "Running docker-entrypoint.sh..."
exec /docker-entrypoint.sh mysqld