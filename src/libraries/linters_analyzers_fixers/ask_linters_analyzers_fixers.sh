#!/bin/bash

calculate_php_options() {
  local options
  declare -a options=()
  options+=("none")

  # shellcheck source=../../general.sh
  source "${tool_dir}/src/general.sh"

  if ! in_array "php_cs_fixer" "${projectinit_libraries_list[@]}"; then
    options+=("PHP CS Fixer")
  fi

  printf "%s\n" "${options[@]}"
}

ask_linters_analyzers_fixers() {
  echo ""
  echo "Select a tool:"
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