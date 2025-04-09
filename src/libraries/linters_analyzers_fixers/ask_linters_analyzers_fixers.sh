#!/bin/bash

ask_linters_analyzers_fixers() {
  echo ""
  echo "Select a tool:"
  case $projectinit_language in
    "php" )
      local options=("PHP CS Fixer")
      local selected
      select selected in "${options[@]}"; do
        case $selected in
          "PHP CS Fixer" )
            projectinit_libraries_list+=("php_cs_fixer")
            # shellcheck source=../../libraries/linters_analyzers_fixers/php/php_cs_fixer/ask_php_cs_fixer.sh
            source "${tool_dir}/src/libraries/linters_analyzers_fixers/php/php_cs_fixer/ask_php_cs_fixer.sh"
            ask_php_cs_fixer_config
            break;;
        esac
      done
      break;;
    "node" )
      break;;
  esac
}