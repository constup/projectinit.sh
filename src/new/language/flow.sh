#!/bin/bash

run_flow() {
  case $projectinit_language in
    "php" )
      # shellcheck source=./php/flow.sh
      source "${tool_dir}/src/new/language/php/flow.sh"
      run_php_flow
      ;;
    "node" )
      ;;
  esac
}