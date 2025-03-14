#!/bin/bash

ask_project_type() {
  echo ""
  echo "Choose project type:"
  local options=("NestJS")
  local option
  select option in "${options[@]}"; do
    case $option in
      "NestJS" )
        projectinit_project_type="nestjs"
        # shellcheck source=./node.sh
        source "${tool_dir}/src/language/node/node.sh"
        ask_package_manager
        # shellcheck source=./nestjs/nestjs.sh
        source "${tool_dir}/src/language/node/nestjs/nestjs.sh"
        ask_nestjs_version
        ask_typescript_strict_mode
        break;;
    esac
  done
}