#!/bin/bash

run_node_flow() {
  case $projectinit_container_type in
    "none" )
      ;;
    "docker" )
      run_node_docker_flow
      # shellcheck source=../../container/docker/projectinit_cli/docker_projectinit_cli.sh
      source "${tool_dir}/src/container/docker/projectinit_cli/docker_projectinit_cli.sh"
      setup_docker_projectinit_cli
      ;;
  esac
}

run_node_docker_flow() {
  case $projectinit_project_type in
    "nestjs" )
      # shellcheck source=./nestjs/flow.sh
      source "${tool_dir}/src/language/node/nestjs/flow.sh"
      run_nestjs_flow_docker
      ;;
  esac
}