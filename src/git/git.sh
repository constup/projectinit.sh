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
  if [ ! -d "${project_root_dir}/.git/" ]; then
      echo "Your project's root directory is not a Git repository. What do you want to do?"
      local component_git_is_git_directory_options=("Clone an existing repository" "Create a new repository" "Exit this tool")
      select cgigdo in "${component_git_is_git_directory_options[@]}"; do
          case $cgigdo in
              "Clone an existing repository" )
                  echo "Enter repository URL:";
                  local project_repo_url;
                  read -r project_repo_url;
                  cd "${project_root_dir}" || exit 1;
                  git clone "${project_repo_url}" . || local command_failed=1;
                  if [ ${command_failed:-0} -eq 1 ]
                  then
                    echo "Cloning of Git repository failed. Let's add your SSH key to the Agent and see if that helps.";
                    echo "Repository's SSH key:";
                    local repository_ssh_key;
                    local user_home_dir;
                    user_home_dir="$(cd ~ && pwd)";
                    read -r -e repository_ssh_key;
                    if [[ ${repository_ssh_key::1} == "~" ]]
                    then
                      repository_ssh_key=${repository_ssh_key/\~/${user_home_dir}};
                    fi
                    eval "$(ssh-agent -s)";
                    ssh-add "${repository_ssh_key}";
                    git clone "${project_repo_url}" .;
                  fi
                  cd "${tool_dir}" || exit 1;
                  break;;
              "Create a new repository" )
                  cd "${project_root_dir}" && git init;
                  cd "${tool_dir}" || exit 1;
                  break;;
              "Exit this tool" )
                  exit 1;;
          esac
      done
  fi
  echo "Your project root directory is a Git repository."
}

setup_git_user_configuration () {
  echo ""
  echo "Configuring Git user..."
  cd "${project_root_dir}" || exit 1;
  echo "Your global Git username is: "
  git config user.name
  echo "Your global Git user email is: "
  git config user.email
  source "${tool_dir}\config\params\git_user_configuration.sh"
  echo "ProjectInit.sh configured Git username: "
  echo "${GIT_USER_NAME}"
  echo "ProjectInit.sh configured Git email: "
  echo "${GIT_USER_EMAIL}"
  echo "What would you like to do?"
  local git_user_configuration_options=("Use global username and email" "Use username and email configured in ProjectInit.sh" "Enter username and email manually")
  select guco in "${git_user_configuration_options[@]}"; do
    case $guco in
      "Use global username and email" )
        break;;
      "Use username and email configured in ProjectInit.sh" )
        git config user.name "${GIT_USER_NAME}"
        git config user.email "${GIT_USER_EMAIL}"
        echo "User name: ${GIT_USER_NAME}"
        echo "User email: ${GIT_USER_EMAIL}"
        break;;
      "Enter username and email manually" )
        echo "Enter Git username:"
        local git_username_manual
        read -r git_username_manual
        echo "Enter Git user email:"
        local git_user_email_manual
        read -r git_user_email_manual
        git config user.name "${git_username_manual}"
        git config user.email "${git_user_email_manual}"
        break;;
      esac
  done
  echo "Git user configured."
}

generate_generic_gitignore_for_php () {
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
