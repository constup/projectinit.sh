#!/bin/bash

ask_base_service_properties() {
  echo "Application Docker service properties:"
  echo "  Docker service name:"
  read -r -e projectinit_app_service_name
  echo "  Application host port:"
  read -r -e projectinit_app_host_port
}

calculate_app_service_dependencies() {
  projectinit_docker_service_dependencies=0
  if [ ! "${projectinit_database_type}" = "no database" ]; then
    projectinit_docker_service_dependencies=$((projectinit_docker_service_dependencies + 1))
  fi
}