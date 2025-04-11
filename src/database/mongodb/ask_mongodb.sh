#!/bin/bash

ask_mongodb_config() {
  echo ""
  echo "MongoDB configuration:"
  echo "Available database versions: https://hub.docker.com/_/mongo"
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
  echo "  Host port for MongoDB server (container port is 27017):"
  read -r -e projectinit_database_host_port
}