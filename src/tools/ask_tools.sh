#!/bin/bash

ask_tools() {
  echo ""
  echo "Install additional tools:"
  local options=("none" "cache")
  local option
  local install_additional_tools
  install_additional_tools=1
  select option in "${options[@]}"; do
    case $option in
      "none" )
        install_additional_tools=0
        echo "  No additional tools will be installed."
        break;;
      "cache" )
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
      read -r -p "Do you want to install more tools (y/n)?"
      case "${more_options,,}" in
        "y"|"yes"|"yup"|"yeah" ) ask_tools; break;;
        "n"|"no"|"nope" ) echo "  All tools picked..."; break;;
        * ) echo "Invalid input. Asking again..." ;;
      esac
    done
  fi
}