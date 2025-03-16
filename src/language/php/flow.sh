#!/bin/bash

run_php_flow() {
  case $projectinit_container_type in
    "none" )
      run_php_bare_metal_flow
      ;;
    "docker" )
      run_php_docker_flow
      ;;
  esac
}

run_php_bare_metal_flow() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    # shellcheck source=./tools/composer.sh
    source "${tool_dir}/src/language/php/tools/composer.sh"
    download_latest_composer_phar
  fi
  case $projectinit_project_type in
    "composer" )
      # shellcheck source=./composer_package/flow.sh
      source "${tool_dir}/src/language/php/composer_package/flow.sh"
      run_composer_package_flow_bare_metal
      ;;
    "symfony" )
      # shellcheck source=./symfony/flow.sh
      source "${tool_dir}/src/language/php/symfony/flow.sh"
      run_symfony_flow_bare_metal
      ;;
  esac
  # shellcheck source=../../filesystem/directory_management.sh
  source "${tool_dir}/src/filesystem/directory_management.sh"
  create_php_project_base_directories
  # shellcheck source=./tools/unit_testing/phpunit.sh
  source "${tool_dir}/src/language/php/tools/unit_testing/phpunit.sh"
  install_phpunit_bare_metal
  configure_phpunit
  # shellcheck source=./tools/style_fixer/php_cs_fixer.sh
  source "${tool_dir}/src/language/php/tools/style_fixer/php_cs_fixer.sh"
  install_php_cs_fixer_bare_metal
  configure_php_cs_fixer
  # shellcheck source=../../git/git.sh
  source "${tool_dir}/src/git/git.sh"
  configure_gitignore
}

run_php_docker_flow() {
  case $projectinit_project_type in
    "composer" )
      # shellcheck source=./composer_package/flow.sh
      source "${tool_dir}/src/language/php/composer_package/flow.sh"
      run_composer_package_flow_docker
      ;;
    "symfony" )
      # shellcheck source=./symfony/flow.sh
      source "${tool_dir}/src/language/php/symfony/flow.sh"
      run_symfony_flow_docker
      ;;
  esac
}