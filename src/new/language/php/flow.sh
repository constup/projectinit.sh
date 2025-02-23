#!/bin/bash

run_php_flow() {
  case $projectinit_container_type in
    "none" )
      run_bare_metal_flow
      ;;
    "docker" )
      ;;
  esac
}

run_bare_metal_flow() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    # shellcheck source=./tools/composer.sh
    source "${tool_dir}/src/new/language/php/tools/composer.sh"
    download_latest_composer_phar
  fi
  case $projectinit_php_project_type in
    "composer" )
      ;;
    "symfony" )
      # shellcheck source=./symfony/flow.sh
      source "${tool_dir}/src/new/language/php/symfony/flow.sh"
      run_symfony_flow_bare_metal
      ;;
  esac
  # shellcheck source=../../filesystem/directory_management.sh
  source "${tool_dir}/src/new/filesystem/directory_management.sh"
  create_php_project_base_directories
}