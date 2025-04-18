#!/bin/bash

setup_database_docker_compose_dev() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose.yaml"
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start.sh"
      ;;
    "pgsql" )
      projectinit_compose_has_root_volumes=1
      projectinit_compose_has_secrets=1
      # shellcheck source=./pgsql/container/docker/v1/pqsql.sh
      source "${tool_dir}/src/database/pgsql/container/docker/v1/pqsql.sh"
      setup_pgsql_docker_compose_dev
      setup_pgsql_dev_dockerfile
      ;;
    "mysql" )
      projectinit_compose_has_root_volumes=1
      projectinit_compose_has_secrets=1
      # shellcheck source=./mysql/container/docker/v1/mysql.sh
      source "${tool_dir}/src/database/mysql/container/docker/v1/mysql.sh"
      setup_mysql_docker_compose_dev
      setup_mysql_my_cnf_dev
      setup_mysql_dev_entrypoint
      setup_mysql_dev_dockerfile
      ;;
    "percona" )
      projectinit_compose_has_root_volumes=1
      projectinit_compose_has_secrets=1
      # shellcheck source=./percona/container/docker/v1/percona.sh
      source "${tool_dir}/src/database/percona/container/docker/v1/percona.sh"
      setup_percona_docker_compose_dev
      setup_percona_my_cnf_dev
      setup_percona_dev_entrypoint
      setup_percona_dev_dockerfile
      ;;
    "mariadb" )
      projectinit_compose_has_root_volumes=1
      projectinit_compose_has_secrets=1
      # shellcheck source=./mariadb/container/docker/v1/mariadb.sh
      source "${tool_dir}/src/database/mariadb/container/docker/v1/mariadb.sh"
      setup_mariadb_docker_compose_dev
      setup_mariadb_my_cnf_dev
      setup_mariadb_dev_entrypoint
      setup_mariadb_dev_dockerfile
      ;;
    "mongodb" )
      projectinit_compose_has_root_volumes=1
      projectinit_compose_has_secrets=1
      # shellcheck source=./mongodb/container/docker/v1/mongodb.sh
      source "${tool_dir}/src/database/mongodb/container/docker/v1/mongodb.sh"
      setup_mongodb_docker_compose_dev
      setup_mongodb_config_dev
      setup_mongodb_dev_entrypoint
      setup_mongodb_dev_dockerfile
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_database_service_name}:\n        condition: service_healthy/" "${project_root_dir}/compose.yaml"
  fi
}

setup_database_docker_compose_prod() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/projectinit_docker/prod/compose.yaml"
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/projectinit_docker/prod/start.sh"
      ;;
    "pgsql" )
      # shellcheck source=./pgsql/container/docker/v1/pqsql.sh
      source "${tool_dir}/src/database/pgsql/container/docker/v1/pqsql.sh"
      setup_pgsql_docker_compose_prod
      setup_pgsql_prod_dockerfile
      ;;
    "mysql" )
      # shellcheck source=./mysql/container/docker/v1/mysql.sh
      source "${tool_dir}/src/database/mysql/container/docker/v1/mysql.sh"
      setup_mysql_docker_compose_prod
      setup_mysql_my_cnf_prod
      setup_mysql_prod_entrypoint
      setup_mysql_prod_dockerfile
      ;;
    "percona" )
      # shellcheck source=./percona/container/docker/v1/percona.sh
      source "${tool_dir}/src/database/percona/container/docker/v1/percona.sh"
      setup_percona_docker_compose_prod
      setup_percona_my_cnf_prod
      setup_percona_prod_entrypoint
      setup_percona_prod_dockerfile
      ;;
    "mariadb" )
      # shellcheck source=./mariadb/container/docker/v1/mariadb.sh
      source "${tool_dir}/src/database/mariadb/container/docker/v1/mariadb.sh"
      setup_mariadb_docker_compose_prod
      setup_mariadb_my_cnf_prod
      setup_mariadb_prod_entrypoint
      setup_mariadb_prod_dockerfile
      ;;
    "mongodb" )
      # shellcheck source=./mongodb/container/docker/v1/mongodb.sh
      source "${tool_dir}/src/database/mongodb/container/docker/v1/mongodb.sh"
      setup_mongodb_docker_compose_prod
      setup_mongodb_config_prod
      setup_mongodb_prod_entrypoint
      setup_mongodb_prod_dockerfile
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_database_service_name}:\n        condition: service_healthy/" "${project_root_dir}/projectinit_docker/prod/compose.yaml"
  fi
}

setup_database_dockerfile_installer() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  case "${projectinit_database_type}" in
    "mongodb" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        mongodb \\\\/g" "${target_file}"
      ;;
  esac
}

setup_database_dockerfile_dev() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  case "$projectinit_database_type" in
    "pgsql" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_pgsql \\\\/g" "${target_file}"
      ;;
    "mysql" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "percona" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "mariadb" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "mongodb" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        mongodb \\\\/g" "${target_file}"
      ;;
  esac
}

setup_database_dockerfile_prod() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  case "$projectinit_database_type" in
    "pgsql" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_pgsql \\\\/g" "${target_file}"
      ;;
    "mysql" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "percona" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "mariadb" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        pdo_mysql \\\\/g" "${target_file}"
      ;;
    "mongodb" )
      perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        mongodb \\\\/g" "${target_file}"
      ;;
  esac
}