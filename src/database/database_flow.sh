#!/bin/bash

setup_database_docker_compose_dev() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose_dev.yaml"
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
      ;;
    "percona" )
      # shellcheck source=../database/percona/v1/percona.sh
      source "${tool_dir}/src/database/percona/v1/percona.sh"
      setup_docker_compose_dev
      ;;
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_database_service_name}/" "${project_root_dir}/compose_dev.yaml"
  else
    perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose_dev.yaml"
    perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start_dev.sh"
  fi
  if [ "$projectinit_docker_service_dependencies" -eq 0 ]; then
    perl -i -ne 'print unless /depends_on:/;' "${project_root_dir}/compose_dev.yaml"
  fi
}

setup_database_docker_compose_prod() {
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose.yaml"
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
      ;;
    "percona" )
      # shellcheck source=../database/percona/v1/percona.sh
      source "${tool_dir}/src/database/percona/v1/percona.sh"
      setup_docker_compose_prod
      ;;
  esac

  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_database_service_name}/" "${project_root_dir}/compose.yaml"
  else
    perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose.yaml"
    perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start.sh"
  fi
  if [ "$projectinit_docker_service_dependencies" -eq 0 ]; then
    perl -i -ne 'print unless /depends_on:/;' "${project_root_dir}/compose.yaml"
  fi
}

setup_database_dockerfile_dev() {
  case "$projectinit_database_type" in
    "pgsql" )
      perl -pi -e "s/#pdo_pgsql/pdo_pgsql/g" "${project_root_dir}/Dockerfile_dev"
      ;;
    "mysql" )
      perl -pi -e "s/#pdo_mysql/pdo_mysql/g" "${project_root_dir}/Dockerfile_dev"
      ;;
    "percona" )
      perl -pi -e "s/#pdo_mysql/pdo_mysql/g" "${project_root_dir}/Dockerfile_dev"
      ;;
  esac
  perl -i -ne 'print unless /#pdo_mysql/;' "${project_root_dir}/Dockerfile_dev"
  perl -i -ne 'print unless /#pdo_pgsql/;' "${project_root_dir}/Dockerfile_dev"
}

setup_database_dockerfile_prod() {
  case "$projectinit_database_type" in
    "pgsql" )
      perl -pi -e "s/#pdo_pgsql/pdo_pgsql/g" "${project_root_dir}/Dockerfile"
      ;;
    "mysql" )
      perl -pi -e "s/#pdo_mysql/pdo_mysql/g" "${project_root_dir}/Dockerfile"
      ;;
    "percona" )
      perl -pi -e "s/#pdo_mysql/pdo_mysql/g" "${project_root_dir}/Dockerfile"
      ;;
  esac
  perl -i -ne 'print unless /#pdo_mysql/;' "${project_root_dir}/Dockerfile"
  perl -i -ne 'print unless /#pdo_pgsql/;' "${project_root_dir}/Dockerfile"
}