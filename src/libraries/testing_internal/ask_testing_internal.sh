#!/bin/bash

ask_testing_internal() {
  echo ""
  echo "Select testing engine or framework:"
  case $projectinit_language in
    "php" )
      local options=("PHP Unit")
      local selected
      select selected in "${options[@]}"; do
        case $selected in
          "PHP Unit" )
            projectinit_libraries_list+=("phpunit")
            # shellcheck source=./php/php_unit/ask_phpunit.sh
            source "${tool_dir}/src/libraries/testing_internal/php/php_unit/ask_phpunit.sh"
            ask_phpunit
            break;;
        esac
      done
      break;;
    "node" )
      break;;
  esac
}