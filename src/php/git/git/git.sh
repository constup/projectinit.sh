#!/bin/bash

#######################################
# Check if .gitignore file exists in our project's root directory.
# If it doesn't, copy the generic .gitignore file.
# Globals:
#   PROJECT_ROOT_DIR - root directory of your project
#   TOOL_DIR         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
generate_generic_gitignore_for_symfony () {
    echo ""
  echo "Checking .gitignore in ${PROJECT_ROOT_DIR}..."
  if [ ! -f "${PROJECT_ROOT_DIR}/.gitignore" ]; then
      echo "${PROJECT_ROOT_DIR}/.gitignore does not exist. Creating .gitignore automatically..."
      touch "${PROJECT_ROOT_DIR}/.gitignore"
      cat "${TOOL_DIR}/src/git/generic_gitignore/generic.gitignore" >> "${PROJECT_ROOT_DIR}/.gitignore"
  else
      echo "${PROJECT_ROOT_DIR}/.gitignore exists. Skipping automatic creation..."
  fi
  echo ".gitignore setup completed."
}
