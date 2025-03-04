#!/bin/bash

run_node_ask_flow() {
  case "$projectinit_container_type" in
    "none" )
      ;;
    "docker" )
      run_node_docker_ask_flow
      ;;
  esac
}

run_node_docker_ask_flow() {
  # shellcheck source=../../container/docker/docker.sh
  source "${tool_dir}/src/container/docker/docker.sh"
  ask_base_service_properties
}