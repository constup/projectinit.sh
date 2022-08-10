#!/bin/bash

#######################################
# Check if .gitignore file exists in our project's root directory.
# If it doesn't, copy the generic .gitignore file.
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
generate_generic_gitignore_for_symfony () {
    echo ""
  echo "Checking .gitignore in ${project_root_dir}..."
  if [ ! -f "${project_root_dir}/.gitignore" ]; then
      echo "${project_root_dir}/.gitignore does not exist. Creating .gitignore automatically..."
      touch "${project_root_dir}/.gitignore"
      cat "${tool_dir}/src/git/generic_gitignore/generic.gitignore" >> "${project_root_dir}/.gitignore"
  else
      echo "${project_root_dir}/.gitignore exists. Skipping automatic creation..."
  fi
  echo ".gitignore setup completed."
}
