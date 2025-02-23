#!/bin/bash

ask_to_use_container() {
  echo ""
  echo "Would you like to use a container (Docker)?"
  local options=("yes" "no")
  local option
  select option in "${options[@]}"; do
    case $option in
      "yes" )
        ask_container_type
        break;;
      "no" )
        projectinit_container_type="none"
        break;;
    esac
  done
}

ask_container_type() {
  echo ""
  echo "Container type:"
  local options=("Docker")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Docker" )
        projectinit_container_type="docker"
        break;;
    esac
  done
}