#!/bin/bash

ask_project_type() {
  echo ""
  echo "Choose project type:"
  local options=("Composer package" "Symfony")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Composer package" )
        projectinit_project_type="composer"
        break;;
      "Symfony" )
        projectinit_project_type="symfony"
        # shellcheck source=./symfony/symfony.sh
        source "${tool_dir}/src/language/php/symfony/symfony.sh"
        ask_symfony_version
        ask_symfony_app_type
        break;;
    esac
  done
}