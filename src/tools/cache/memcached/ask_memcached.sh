#!/bin/bash

ask_memcached_config() {
  echo ""
  echo "Memcached configuration:"
  echo "Available versions: https://hub.docker.com/_/memcached"
  echo "Version:"
  read -r -e projectinit_memcached_version
  echo "Host port (container port is 11211):"
  read -r -e projectinit_memcached_host_port
  if [ -z "${projectinit_memcached_host_port}" ]; then
    projectinit_memcached_host_port=11211
    echo "  Using default port 11211..."
  fi
}