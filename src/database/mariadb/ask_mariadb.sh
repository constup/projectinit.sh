#!/bin/bash

ask_mariadb_config() {
  echo ""
  echo "MariaDB configuration:"
  echo "Available database versions: https://hub.docker.com/_/mariadb"
  echo "  Database engine version (only numbered versions are allowed, 'latest' is not):"
  read -r -e projectinit_database_version
  echo "  Database name:"
  read -r -e projectinit_database_name
  echo "  Database user:"
  read -r -e projectinit_database_user
  echo "  User password:"
  # shellcheck source=../../general.sh
  source "${tool_dir}/src/general.sh"
  projectinit_database_password=$(read_password)
  echo "  Root password:"
  projectinit_database_root_password=$(read_password)
  echo "  Host port:"
  read -r -e projectinit_database_host_port
}