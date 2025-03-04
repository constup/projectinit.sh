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
      if [ -z "$(ls -A "$project_root_dir")" ]; then
        echo "  Project root directory already exists, but it must be empty."
        exit 1
      else
        echo "  Project root directory already exists and is ready."
      fi
      projectinit_create_project_root_directory=0
  fi
}

create_php_project_base_directories () {
  echo ""
  echo "Checking if ${project_root_dir}/src source directory exists..."
  if [ ! -d "${project_root_dir}/src" ]; then
    echo "${project_root_dir}/src/ does not exist. Creating src directory automatically..."
    mkdir "${project_root_dir}/src"
  else
    echo "${project_root_dir}/src directory exists. Skipping..."
  fi
  echo ""
  echo "Checking if ${project_root_dir}/tests source directory exists..."
  if [ ! -d "${project_root_dir}/tests" ]; then
    echo "${project_root_dir}/tests/ does not exist. Creating tests directory automatically..."
    mkdir "${project_root_dir}/tests"
  else
    echo "${project_root_dir}/tests directory exists. Skipping..."
  fi
}