#!/bin/bash

run_php_ask_flow() {
  case "$projectinit_container_type" in
    "none" )
      ;;
    "docker" )
      run_php_docker_ask_flow
      ;;
  esac
}

run_php_docker_ask_flow() {
  # shellcheck source=../../container/docker/docker.sh
  source "${tool_dir}/src/container/docker/docker.sh"

  case "${projectinit_project_type}" in
    "composer" )
      # shellcheck source=./composer_package/composer.sh
      source "${tool_dir}/src/language/php/composer_package/composer.sh"
      ask_composer_library_config
      ask_base_service_properties
      ;;
    "symfony" )
      ask_base_service_properties
      # shellcheck source=../../database/ask_database.sh
      source "${tool_dir}/src/database/ask_database.sh"
      ask_database_engine
      case "${projectinit_database_type}" in
        "mysql"|"mariadb"|"percona"|"pgsql" )
          projectinit_orm="Doctrine ORM Bundle"
          ;;
        "mongodb" )
          projectinit_orm="Doctrine MongoDB ODM Bundle"
          ;;
      esac

      # shellcheck source=../../tools/ask_tools.sh
      source "${tool_dir}/src/tools/ask_tools.sh"
      ask_tools
      ;;
  esac
}