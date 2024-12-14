#!/bin/bash

docker_pick_php_project_type() {
  echo ""
  echo "Project type:"
  local project_type=("Symfony")
  select option in "${project_type[@]}"; do
    case $option in
      "Symfony" )
        # shellcheck source=../integrations/database/database.sh
        source "${tool_dir}/src/docker/integrations/database/database.sh"
        pick_database_engine
        # shellcheck source=./symfony/version.sh
        source "${tool_dir}/src/docker/php/symfony/version.sh"
        docker_pick_php_symfony_version
        break;;
    esac
  done      
}