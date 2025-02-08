#!/bin/bash

#######################################
# Pick a version of a Symfony 7.2. project. The versions are limited to what Symfony 7.2. supports.
# Globals:
#   PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION - selected PHP version, default is 8.2
# Arguments:
#  None
#######################################
pick_php_version() {
  echo ""
  cd "${project_root_dir}" || exit 1
  echo "Pick PHP version (default: 8.2):"
  local pick_php_version=("8.2" "8.3" "8.4")
  local selection
  select selection in "${pick_php_version[@]}"; do
    case $selection in
      "8.2"|"" )
        PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION="8.2"
        break;;
      "8.3" )
        PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION="8.3"
        break;;
      "8.4" )
        PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION="8.4"
        break;;
    esac
  done
}