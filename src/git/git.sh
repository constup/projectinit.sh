#!/bin/bash

check_user_configuration () {
    if [ ! -f ../../config/params/git_user_configuration.sh ]; then
    echo -e "\n../../config/params/git_user_configuration.sh not found. Run configure.sh to complete configuration."
        exit 1
    fi
}

is_git_directory () {
  echo ""
  echo "Checking if your project root dir is a Git repository..."
  if [ ! -d "${PROJECT_ROOT_DIR}/.git/" ]; then
      echo "Your project's root directory is not a Git repository. What do you want to do?"
      local component_git_is_git_directory_options=("Clone an existing repository" "Create a new repository" "Exit this tool")
      select cgigdo in "${component_git_is_git_directory_options[@]}"; do
          case $cgigdo in
              "Clone an existing repository" )
                  echo "Enter repository URL:";
                  local PROJECT_REPO_URL;
                  read -r PROJECT_REPO_URL;
                  cd "${PROJECT_ROOT_DIR}" && git clone "${PROJECT_REPO_URL}" .;
                  cd "${TOOL_DIR}" || exit 1;
                  break;;
              "Create a new repository" )
                  cd "${PROJECT_ROOT_DIR}" && git init;
                  cd "${TOOL_DIR}" || exit 1;
                  break;;
              "Exit this tool" )
                  exit 1;;
          esac
      done
  fi
  echo "Your project root directory is a Git repository."
}

setup_git_user_configuration () {
  source "${TOOL_DIR}\config\params\git_user_configuration.sh"
  echo ""
  echo "Configuring Git user..."
  git config user.name "${GIT_USER_NAME}"
  git config user.email "${GIT_USER_EMAIL}"
  echo "User name: ${GIT_USER_NAME}"
  echo "User email: ${GIT_USER_EMAIL}"
  echo "Git user configured."
}

generate_generic_gitignore_for_php () {
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
