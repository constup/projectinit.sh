#!/bin/bash

#######################################
# description
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
nodejs_new_or_existing_project() {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Do yoy wish to:"
  local new_or_existing_project=("NEW - Create a new NodeJS project" "EXISTING - Continue working on an existing NodeJS project")
  select noep in "${new_or_existing_project[@]}"; do
    case $noep in
      "NEW - Create a new NodeJS project" )
        choose_nodejs_project_type
        break;;
      "EXISTING - Continue working on an existing NodeJS project" )
        break;;
    esac
  done
}

#######################################
# Offer a dialog for picking a type of NodeJS project which you want to create.
# Globals:
#   tool_dir         - root directory of projectinit.sh
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
choose_nodejs_project_type () {
  echo "";
  source "${tool_dir}/src/nodejs/nestjs/create_project.sh"
  source "${tool_dir}/src/nodejs/nestjs/nestjs.sh"
  cd "${project_root_dir}" || exit 1;
  echo "Choose the type of your new project:"
  local nodejs_project_type=("NestJS application")
  select npt in "${nodejs_project_type[@]}"; do
    case $npt in
      "NestJS application" )
        check_and_install_nestjs
        create_new_nestjs9_project
        break;;
    esac
  done
}
