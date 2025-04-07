#!/bin/bash

ask_tools() {
  echo ""
  echo "Install additional tools:"
  local options=("none" "Testing (internal)" "Cache")
  local option
  local install_additional_tools
  install_additional_tools=1
  select option in "${options[@]}"; do
    case $option in
      "none" )
        install_additional_tools=0
        echo "  No additional tools will be installed."
        break;;
      "Testing (internal)" )
        # shellcheck source=./testing_internal/ask_testing_internal.sh
        source "${tool_dir}/src/tools/testing_internal/ask_testing_internal.sh"
        ask_testing_internal
        break;;
      "Cache" )
        # shellcheck source=./cache/ask_cache.sh
        source "${tool_dir}/src/tools/cache/ask_cache.sh"
        ask_cache
        break;;
    esac
  done

  if [ "${install_additional_tools}" -eq 1 ]; then
    echo ""
    local more_options
    while true; do
      read -r -p "Do you want to install more tools (y/n)?" more_options
      case "${more_options,,}" in
        "y"|"yes"|"yup"|"yeah"|"1" ) ask_tools; break;;
        "n"|"no"|"nope"|"2" ) echo "  All tools picked..."; break;;
        * ) echo "Invalid input. Asking again..." ;;
      esac
    done
  fi
}