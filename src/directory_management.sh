#!/bin/bash

init_directories () {
  echo ""
  echo "Initializing directories..."
  local script_parent_dir
  script_parent_dir="$(dirname "$(pwd)")"
  TOOL_DIR="$(dirname "$script_parent_dir")"
  echo "Your project's root directory:"
  read -r PROJECT_ROOT_DIR
  echo "Tool directory: ${TOOL_DIR}"
  echo "Project root dir: ${PROJECT_ROOT_DIR}"
  echo "Directory initialization completed."
}

switch_to_project_dir () {
  cd "${PROJECT_ROOT_DIR}" || exit 1
  echo "Directory changed to ${PROJECT_ROOT_DIR}"
}

switch_to_tool_dir () {
  cd "${TOOL_DIR}" || exit 1
  echo "Directory changed to ${TOOL_DIR}"
}

setup_root_project_directory () {
  echo ""
  echo "Checking if your project root directory exists..."
  if [ ! -d "${PROJECT_ROOT_DIR}" ]; then
      echo "Your project directory doesn't exist. What do you want to do?"
      local component_project_directory_exists_options=("Create directory" "Exit this tool")
      select cpdeo in "${component_project_directory_exists_options[@]}"; do
          case $cpdeo in
              "Create directory" )
                  mkdir -p "${PROJECT_ROOT_DIR}";
                  echo -e "\nDirectory created.\n";
                  break;;
              "Exit this tool" )
                  exit 1;;
          esac
      done
  fi
  echo "Project directory is available."
}
