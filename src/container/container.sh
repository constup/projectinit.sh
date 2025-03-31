#!/bin/bash

ask_to_use_container() {
  echo ""
  local options
  while true; do
    read -r -p "Would you like to use a container (Docker, Podman,...) (y/n)?" options
    case "${options,,}" in
      "y"|"yes"|"yup"|"yeah"|"1" ) ask_container_type; ask_to_build_containers; break;;
      "n"|"no"|"nope"|"2" ) projectinit_container_type="none"; break;;
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

ask_to_build_containers() {
  echo ""
  local options
  while true; do
    read -r -p "Automatically build containers (y/n)?" options
    case "${options,,}" in
      "y"|"yes"|"yup"|"yeah"|"1" ) projectinit_build_containers=1; break;;
      "n"|"no"|"nope"|"2" ) projectinit_build_containers=0; break;;
      * ) echo "Invalid input. Asking again..." ;;
    esac
  done
}