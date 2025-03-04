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

  case "${projectinit_php_project_type}" in
    "composer" )
      # shellcheck source=./composer_package/composer.sh
      source "${tool_dir}/src/language/php/composer_package/composer.sh"
      ask_composer_library_config
      ask_base_service_properties
      ;;
    "symfony" )
      ask_base_service_properties
      # shellcheck source=../../database/database.sh
      source "${tool_dir}/src/database/database.sh"
      ask_database_engine
      ;;
  esac
}