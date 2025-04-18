#!/bin/bash

ask_language() {
  echo ""
  echo "Language or technology:"
  local options=("PHP" "Node")
  local option
  select option in "${options[@]}"; do
    case $option in
      "PHP" )
        projectinit_language="php"
        if [ "${projectinit_container_type}" = "none" ]; then
          # shellcheck source=./php/tools/composer.sh
          source "${tool_dir}/src/language/php/tools/composer.sh"
          ask_composer_location
        fi
        # shellcheck source=./php/project_type.sh
        source "${tool_dir}/src/language/php/project_type.sh"
        ask_project_type
        break;;
      "Node" )
        projectinit_language="node"
        # shellcheck source=./node/project_type.sh
        source "${tool_dir}/src/language/node/project_type.sh"
        ask_project_type
        break;;
    esac
  done
}