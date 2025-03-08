#!/bin/bash

run_flow() {
  projectinit_compose_has_secrets=0
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