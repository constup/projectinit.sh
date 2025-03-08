#!/bin/bash

#######################################
# Create a new Symfony application.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  $1 - Symfony version. Example: 7.2
#  $2 - Type of Symfony application. Possible values: 'full', 'api'
#  $1 - Project creation method. Placeholder for adding support for Symfony CLI. Possible values: 'composer'
#######################################
create_symfony_project () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Setting up a new Symfony $1 $2 application using $3..."
  case "$3" in
    "composer" )
      if [ "${projectinit_use_global_composer}" -eq 0 ]; then
        php composer.phar create-project symfony/skeleton:"$1" temp
      else
        composer create-project symfony/skeleton:"$1" temp
      fi
      cp -a temp/. . && rm -rf temp/
        if [ "$2" == 'full' ]; then
          php composer.phar require webapp
        fi
      ;;
  esac
}

ask_symfony_version() {
  echo ""
  echo "Select Symfony version. Note: the latest minor version will be used."
  local options=("Symfony 7" "Symfony 6" "Symfony 5" "Custom")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Symfony 7" )
        echo ""
        echo "Symfony 7.2 will be used."
        echo "  - Release date: November 2024."
        echo "  - End of support: July 2025."
        echo "  - Requires PHP 8.2.0 or higher."
        echo ""
        projectinit_symfony_version="7.2.x"
        break;;
      "Symfony 6" )
        echo ""
        echo "Symfony 6.4 will be used."
        echo "  - Release date: November 2023."
        echo "  - End of bug fixes: November 2026."
        echo "  - End of security fixes: February 2027."
        echo "  - Requires PHP 8.1.0 or higher."
        echo ""
        projectinit_symfony_version="6.4.x"
        break;;
      "Symfony 5" )
        echo ""
        echo "Symfony 5.4 will be used."
        echo "  - Release date: November 2021."
        echo "  - End of bug fixes: November 2024."
        echo "  - End of security fixes: February 2029."
        echo "  - Requires PHP 7.2.5 or higher."
        echo ""
        projectinit_symfony_version="5.4.x"
        break;;
      "Custom" )
        echo ""
        echo "Manually enter your desired Symfony version (format: 7.1):"
        read -r -e projectinit_symfony_version
        projectinit_symfony_version="${projectinit_symfony_version}.x"
        break;;
    esac
  done

  echo "Are you sure?"
  local confirmation_options=("yes" "no")
  local confirmation_option
  select confirmation_option in "${confirmation_options[@]}"; do
    case $confirmation_option in
      "yes" )
        break;;
      "no" )
        ask_symfony_version
        break;;
    esac
  done
}

ask_symfony_app_type() {
  echo ""
  echo "Choose application type:"
  local options=("Web application with frontend" "CLI or API application")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Web application with frontend" )
        projectinit_symfony_app_type="full"
        break;;
      "CLI or API application" )
        projectinit_symfony_app_type="api"
        break;;
    esac
  done
}