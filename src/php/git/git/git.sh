#!/bin/bash

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
