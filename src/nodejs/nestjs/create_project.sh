#!/bin/bash

#######################################
# Create a new NestJS application.
# Prompts for project name and whether user wants to have TypeScript Strict mode enabled.
# This will also install packages.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_new_nestjs9_project() {
  echo ""
  cd "${project_root_dir}" || exit 1;

  echo "Set the name of your project (format: my-new-project):"
  local project_name
  read -r -e project_name

  echo "Do you want to enable TypeScript strict mode? (y/n)"
  local yn
  read -r -e yn
  local typescript_strict_mode
  if [ "${yn,,}" == "y" ]; then
    typescript_strict_mode=" strict";
  else
    typescript_strict_mode="";
  fi

  echo "Setting up a new NestJS 9 project..."
  nest new "${project_name}" --directory=. skip-git"${typescript_strict_mode}"
  echo "New NestJS 9 application setup completed."
}
