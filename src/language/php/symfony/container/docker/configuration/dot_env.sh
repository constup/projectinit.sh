#!/bin/bash

add_database_connection_to_env_dev() {
  if [ ! -f "${project_root_dir}/.env.dev" ]; then
    touch "${project_root_dir}/.env.dev"
  fi
  local database_engine
  local database_port
  case "$projectinit_database_type" in
    "pgsql" )
      database_engine=postgresql
      database_port=5432
      ;;
    "mysql" )
      database_engine=mysql
      database_port=3306
      ;;
    "percona" )
      database_engine=mysql
      database_port=3306
      ;;
    "mariadb" )
      database_engine=mysql
      database_port=3306
      ;;
  esac
  echo "DATABASE_URL=\"${database_engine}://${projectinit_database_user}:${projectinit_database_password}@${projectinit_database_service_name}:${database_port}/${projectinit_database_name}?serverVersion=${projectinit_database_version}&charset=utf8\"" >> "${project_root_dir}/.env.dev"
}