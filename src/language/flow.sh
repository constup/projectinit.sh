#!/bin/bash

run_flow() {
  case $projectinit_language in
    "php" )
      # shellcheck source=./php/flow.sh
      source "${tool_dir}/src/language/php/flow.sh"
      run_php_flow
      ;;
    "node" )
      # shellcheck source=./node/flow.sh
      source "${tool_dir}/src/language/node/flow.sh"
      run_node_flow
      ;;
  esac
}

init_globals_before_starting_flow() {
  projectinit_app_service_name="${projectinit_project_name}_app"
  if [ "${projectinit_database_type}" != "no database" ]; then
    projectinit_database_service_name="${projectinit_project_name}_database"
  fi
}