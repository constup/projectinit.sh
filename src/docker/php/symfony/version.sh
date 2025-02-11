#!/bin/bash

docker_pick_php_symfony_version() {
  echo ""
  echo "Symfony version:"
  local selection=("7.1" "7.2")
  select option in "${selection[@]}"; do
    case $option in
      "7.1" )
        PROJECTINIT_DOCKER_INPUT_SYMFONY_VERSION="7.1"
        docker_pick_php_symfony_project_type
        # shellcheck source=./7.1/php_version.sh
        source "${tool_dir}/src/docker/php/symfony/7.1/php_version.sh"
        pick_php_version
        # shellcheck source=./7.1/integrations/phpunit.sh
        source "${tool_dir}/src/docker/php/symfony/7.1/integrations/phpunit.sh"
        select_phpunit_version
        # shellcheck source=./7.1/templates.sh
        source "${tool_dir}/src/docker/php/symfony/7.1/templates.sh"
        setup_installer_templates
        setup_project_templates
        break;;
      "7.2" )
        PROJECTINIT_DOCKER_INPUT_SYMFONY_VERSION="7.2"
        docker_pick_php_symfony_project_type
        # shellcheck source=./7.2/php_version.sh
        source "${tool_dir}/src/docker/php/symfony/7.2/php_version.sh"
        pick_php_version
        # shellcheck source=./7.2/integrations/phpunit.sh
        source "${tool_dir}/src/docker/php/symfony/7.2/integrations/phpunit.sh"
        select_phpunit_version
        # shellcheck source=./7.2/templates.sh
        source "${tool_dir}/src/docker/php/symfony/7.2/templates.sh"
        setup_installer_templates
        setup_project_templates
        break;;
    esac
  done      
}

docker_pick_php_symfony_project_type () {
  echo ""
  echo "Type of Symfony application:"
  local selection=("Web application with frontend" "CLI, REST or microservices application")
  select option in "${selection[@]}"; do
    case $option in
      "Web application with frontend" )
        PROJECTINIT_DOCKER_SYMFONY_APP_TYPE="full"
        break;;
      "CLI, REST or microservices application" )
        PROJECTINIT_DOCKER_SYMFONY_APP_TYPE="cli"
        break;;
    esac
  done
}