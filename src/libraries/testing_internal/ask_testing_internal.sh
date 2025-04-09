#!/bin/bash

calculate_php_options() {
  local options
  declare -a options=()
  options+=("none")

  # shellcheck source=../../general.sh
  source "${tool_dir}/src/general.sh"

  if ! in_array "phpunit" "${projectinit_libraries_list[@]}"; then
    options+=("PHP Unit")
  fi

  printf "%s\n" "${options[@]}"
}

ask_testing_internal() {
  echo ""
  echo "Select testing engine or framework:"
  case $projectinit_language in
    "php" )
      local options
      declare -a options=()
      mapfile -t options < <(calculate_php_options)
      local selected
      select selected in "${options[@]}"; do
        case $selected in
          "none" )
            break;;
          "PHP Unit" )
            projectinit_libraries_list+=("phpunit")
            # shellcheck source=./php/php_unit/ask_phpunit.sh
            source "${tool_dir}/src/libraries/testing_internal/php/php_unit/ask_phpunit.sh"
            ask_phpunit
            break;;
        esac
      done
      ;;
    "node" )
      ;;
  esac
}