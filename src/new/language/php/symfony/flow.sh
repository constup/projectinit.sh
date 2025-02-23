#!/bin/bash

run_symfony_flow_bare_metal() {
  # shellcheck source=./symfony.sh
  source "${tool_dir}/src/new/language/php/symfony/symfony.sh"
  create_symfony_project "$projectinit_symfony_version" "$projectinit_symfony_app_type" "composer"
  # shellcheck source=../phpunit.sh
  source "${tool_dir}/src/new/language/php/phpunit.sh"
  install_phpunit_bare_metal
}