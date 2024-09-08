#!/bin/bash

#######################################
# Initialize directories for the project. This function sets `project_root_dir` and `tool_dir` global variables. You can
# re-use them after this initialization whenever needed.
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
init_directories () {
  echo ""
  echo "Initializing directories..."
  local script_parent_dir
  script_parent_dir="$(dirname "$(pwd)")"
  tool_dir="$(dirname "$script_parent_dir")"
  echo "Your project's root directory:"
  read -r -e project_root_dir
  echo "Tool directory: ${tool_dir}"
  echo "Project root dir: ${project_root_dir}"
  echo "Directory initialization completed."
}

#######################################
# Change the active directory to project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
switch_to_project_dir () {
  cd "${project_root_dir}" || exit 1
  echo "Directory changed to ${project_root_dir}"
}

#######################################
# Change the active directory to projectinit.sh root directory.
# Globals:
#   tool_dir - root directory of projectinit.sh
# Arguments:
#  None
#######################################
switch_to_tool_dir () {
  cd "${tool_dir}" || exit 1
  echo "Directory changed to ${tool_dir}"
}

#######################################
# Check if project's root directory exists and create it if it does not.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
setup_root_project_directory () {
  echo ""
  echo "Checking if your project root directory exists..."
  if [ ! -d "${project_root_dir}" ]; then
      echo "Project directory does not exist. Creating..."
      mkdir -p "${project_root_dir}";
  fi
  echo "Project directory is available."
}
