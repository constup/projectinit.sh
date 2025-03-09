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
    echo "Do you want to install more tools?"
    local more_options=("yes" "no")
    local more_option
    select more_option in "${more_options[@]}"; do
      case $more_option in
        "yes" )
          ask_tools
          break;;
        "no" )
          echo "  All tools picked..."
          break;;
      esac
    done
  fi
}