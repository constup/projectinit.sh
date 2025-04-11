#!/bin/bash

ask_libraries() {
  echo ""
  echo "Install additional libraries:"
  local options=("none" "Testing (internal)" "Linters, analyzers and fixers")
  local option
  local install_additional_libraries
  install_additional_libraries=1
  select option in "${options[@]}"; do
    case $option in
      "none" )
        install_additional_libraries=0
        echo "  No additional libraries will be installed."
        break;;
      "Testing (internal)" )
        # shellcheck source=./testing_internal/ask_testing_internal.sh
        source "${tool_dir}/src/libraries/testing_internal/ask_testing_internal.sh"
        ask_testing_internal
        break;;
      "Linters, analyzers and fixers" )
        # shellcheck source=./linters_analyzers_fixers/ask_linters_analyzers_fixers.sh
        source "${tool_dir}/src/libraries/linters_analyzers_fixers/ask_linters_analyzers_fixers.sh"
        ask_linters_analyzers_fixers
        break;;
    esac
  done

  if [ "${install_additional_libraries}" -eq 1 ]; then
    echo ""
    local more_options
    while true; do
      read -r -p "Do you want to install more libraries (y/n)?" more_options
      case "${more_options,,}" in
        "y"|"yes"|"yup"|"yeah"|"1" ) ask_libraries; break;;
        "n"|"no"|"nope"|"2" ) echo "  All libraries picked..."; break;;
        * ) echo "Invalid input. Asking again..." ;;
      esac
    done
  fi
}