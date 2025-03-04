#!/bin/bash

run_ask_flow() {
  # shellcheck source=../container/container.sh
  source "${tool_dir}/src/container/container.sh"
  ask_to_use_container
  # shellcheck source=language.sh
  source "${tool_dir}/src/language/language.sh"
  ask_language

  case $projectinit_language in
    "php" )
      # shellcheck source=./php/ask_flow.sh
      source "${tool_dir}/src/language/php/ask_flow.sh"
      run_php_ask_flow
      ;;
    "node" )
      # shellcheck source=./node/ask_flow.sh
      source "${tool_dir}/src/language/node/ask_flow.sh"
      run_node_ask_flow
      ;;
  esac
}