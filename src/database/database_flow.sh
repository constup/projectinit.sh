#!/bin/bash

setup_database_docker_compose_dev() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose.yaml"
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start.sh"
      ;;
    "pgsql" )
      # shellcheck source=../database/pgsql/v1/pqsql.sh
      source "${tool_dir}/src/database/pgsql/v1/pqsql.sh"
      setup_docker_compose_dev
      ;;
    "mysql" )
      # shellcheck source=../database/mysql/v1/mysql.sh
      source "${tool_dir}/src/database/mysql/v1/mysql.sh"
      setup_docker_compose_dev
      setup_my_cnf_dev
      setup_dev_entrypoint
      ;;
    "percona" )
      # shellcheck source=../database/percona/v1/percona.sh
      source "${tool_dir}/src/database/percona/v1/percona.sh"
      setup_docker_compose_dev
      ;;
    "mariadb" )
      # shellcheck source=../database/mariadb/v1/mariadb.sh
      source "${tool_dir}/src/database/mariadb/v1/mariadb.sh"
      setup_docker_compose_dev
      ;;
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_database_service_name}/" "${project_root_dir}/compose.yaml"
  fi
}

setup_database_docker_compose_prod() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/projectinit_docker/prod/compose.yaml"
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/projectinit_docker/prod/start.sh"
      ;;
    "pgsql" )
      # shellcheck source=../database/pgsql/v1/pqsql.sh
      source "${tool_dir}/src/database/pgsql/v1/pqsql.sh"
      setup_docker_compose_prod
      ;;
    "mysql" )
      # shellcheck source=../database/mysql/v1/mysql.sh
      source "${tool_dir}/src/database/mysql/v1/mysql.sh"
      setup_docker_compose_prod
      setup_my_cnf_prod
      setup_prod_entrypoint
      ;;
    "percona" )
      # shellcheck source=../database/percona/v1/percona.sh
      source "${tool_dir}/src/database/percona/v1/percona.sh"
      setup_docker_compose_prod
      ;;
    "mariadb" )
      # shellcheck source=../database/mariadb/v1/mariadb.sh
      source "${tool_dir}/src/database/mariadb/v1/mariadb.sh"
      setup_docker_compose_prod
      ;;
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_database_service_name}/" "${project_root_dir}/projectinit_docker/prod/compose.yaml"
  fi
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
  esac
}