#!/bin/bash

ask_to_use_container() {
  echo ""
  local options
  while true; do
    read -r -p "Would you like to use a container (Docker, Podman,...) (y/n)?" options
    case "${options,,}" in
      "y"|"yes"|"yup"|"yeah" ) ask_container_type; break;;
      "n"|"no"|"nope" ) projectinit_container_type="none"; break;;
      * ) echo "Invalid input. Asking again..." ;;
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