#!/bin/bash

ask_percona_config() {
  echo ""
  echo "Percona configuration:"
  echo "Available database versions: https://hub.docker.com/_/percona"
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
  if [ "$projectinit_container_type" = "docker" ]; then
    echo "  Docker service name:"
    read -r -e projectinit_database_service_name
  fi
}