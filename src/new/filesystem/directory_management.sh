#!/bin/bash

#######################################
# Initialize directories for the project. This function sets `project_root_dir` and `tool_dir` global variables.
#######################################
ask_directories () {
  echo ""
  echo "Initializing directories..."
#  local script_parent_dir
#  script_parent_dir="$(dirname "$(pwd)")"
  tool_dir="$(dirname "$(pwd)")"
  echo "Your project's root directory:"
  read -r -e project_root_dir
  echo "  ProjectInit.sh directory: ${tool_dir}"
  echo "  Project root directory: ${project_root_dir}"
  echo "Directory initialization completed."
}

create_directories() {
  if [ ! -d "${project_root_dir}" ]; then
    mkdir -p "${project_root_dir}"
  fi
}

#######################################
# Check if project's root directory exists and create it if it does not.
#######################################
check_project_root_directory () {
  echo ""
  echo "Checking if project root directory exists..."
  if [ ! -d "${project_root_dir}" ]; then
      echo "  Project root directory does not exist. It will be created."
      projectinit_create_project_root_directory=1
  else
      echo "  Project root directory already exists."
      projectinit_create_project_root_directory=0
  fi
}