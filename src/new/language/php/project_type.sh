#!/bin/bash

ask_project_type() {
  echo ""
  echo "Choose project type:"
  local options=("Composer package" "Symfony")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Composer package" )
        projectinit_php_project_type="composer"
        break;;
      "Symfony" )
        projectinit_php_project_type="symfony"
        # shellcheck source=./symfony/symfony.sh
        source "${tool_dir}/src/new/language/php/symfony/symfony.sh"
        ask_symfony_version
        ask_symfony_app_type
        # shellcheck source=./symfony/phpunit.sh
        source "${tool_dir}/src/new/language/php/symfony/phpunit.sh"
        ask_phpunit_version
        break;;
    esac
  done
}