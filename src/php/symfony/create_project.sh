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
    'composer')
      php composer.phar create-project symfony/skeleton:"^$1" temp
      cp -a temp/. . && rm -rf temp/
        if [ "$2" == 'full' ]; then
          php composer.phar require webapp
        fi
      ;;
  esac
}
