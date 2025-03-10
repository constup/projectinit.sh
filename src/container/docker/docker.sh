#!/bin/bash

ask_base_service_properties() {
  echo "Docker application service properties:"
  case $projectinit_language in
    "php" )
      echo "  PHP version:"
      ;;
    "node" )
      echo "  Node version:"
      ;;
  esac
  read -r -e projectinit_language_version
  echo "  Application host port:"
  read -r -e projectinit_app_host_port
}

calculate_app_service_dependencies() {
  projectinit_docker_service_dependencies=0
  if [ ! "${projectinit_database_type}" = "no database" ]; then
    projectinit_docker_service_dependencies=$((projectinit_docker_service_dependencies + 1))
  fi
  if [ "${projectinit_use_memcached}" -eq 1 ]; then
    projectinit_docker_service_dependencies=$((projectinit_docker_service_dependencies + 1))
  fi
}