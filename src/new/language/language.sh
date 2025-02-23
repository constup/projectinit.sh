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
          source "${tool_dir}/src/new/language/php/tools/composer.sh"
          ask_composer_location
        fi
        # shellcheck source=./php/project_type.sh
        source "${tool_dir}/src/new/language/php/project_type.sh"
        ask_project_type
        # shellcheck source=./php/tools/style_fixer/php_cs_fixer.sh
        source "${tool_dir}/src/new/language/php/tools/style_fixer/php_cs_fixer.sh"
        ask_php_cs_fixer_config
        # shellcheck source=./php/tools/unit_testing/phpunit.sh
        source "${tool_dir}/src/new/language/php/tools/unit_testing/phpunit.sh"
        ask_phpunit_config
        break;;
      "Node" )
        projectinit_language="node"
        break;;
    esac
  done
}