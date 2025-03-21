#!/bin/bash

ask_package_manager() {
  echo ""
  echo "Package manager (npm):"
  local options=("npm" "yarn" "pnpm")
  local option
  select option in "${options[@]}"; do
    case $option in
      "npm"|"" )
        projectinit_node_package_manager="npm"
        break;;
      "yarn" )
        projectinit_node_package_manager="yarn"
        break;;
       "pnpm" )
        projectinit_node_package_manager="pnpm"
        break;;
     esac
  done
}