#!/bin/bash

docker_pick_language() {
  echo ""
  echo "Language:"
  local language=("PHP")
  select option in "${language[@]}"; do
    case $option in
      "PHP" )
        # shellcheck source=./../php/project_type.sh
        source "${tool_dir}/src/docker/php/project_type.sh"
        docker_pick_php_project_type
        break;;
    esac
  done
}
