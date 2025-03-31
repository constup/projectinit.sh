#!/bin/bash

#######################################
# Check if Git user configuration for projectinit.sh is present.
#######################################
check_user_configuration() {
  if [ ! -f ../config/params/git_user_configuration.sh ]; then
    echo -e "git_user_configuration.sh not found. Run configure.sh to complete configuration."
    exit 1
  fi
}

#######################################
# Ask whether to replace the existing (or, better to say, automatically generated) .gitignore with ProjectInit.sh
# .gitignore.
#######################################
ask_gitignore_configuration() {
  echo ""
  echo "Do you want to use the default .gitignore (if there is any) or ProjectInit.sh .gitignore file?"
  echo "NOTE: Recommended entries which ProjectIit uses (like Docker Compose secrets) will be added regardless of the chosen option."
  local options=("Use default .gitignore" "Use ProjectInit.sh .gitignore")
  local selection
  select selection in "${options[@]}"; do
    case $selection in
      "Use default .gitignore")
        projectinit_use_projectinit_gitignore=0
        break
        ;;
      "Use ProjectInit.sh .gitignore")
        projectinit_use_projectinit_gitignore=1
        break
        ;;
    esac
  done
}

configure_gitignore() {
  local target_file
  target_file="${project_root_dir}/.gitignore"
  echo ""
  echo "Configuring .gitignore..."
  if [ "$projectinit_use_projectinit_gitignore" -eq 1 ]; then
    cp -f "${tool_dir}/src/git/generic_gitignore/generic.gitignore" "${target_file}"
  else
    if [ ! -f "${project_root_dir}/.gitignore" ]; then
      touch "${project_root_dir}/.gitignore"
    fi
    echo "# ProjectInit.sh" >> "${target_file}"
    echo ".env.docker" >> "${target_file}"
    echo "compose_secrets/" >> "${target_file}"
    echo "database_volume/" >> "${target_file}"
    echo "codeCoverage/" >> "${target_file}"
    echo "projectinit_cli.sh" >> "${target_file}"
  fi
  echo "  .gitignore configured..."
}

ask_gitattributes_configuration() {
  echo ""
  echo "Do you want to use the default .gitattributes (if there is any) or ProjectInit.sh .gitattributes file?"
  local options=("Use default .gitattributes" "Use ProjectInit.sh .gitattributes")
  local selection
  select selection in "${options[@]}"; do
    case $selection in
      "Use default .gitattributes")
        projectinit_use_projectinit_gitattributes=0
        break
        ;;
      "Use ProjectInit.sh .gitattributes")
        projectinit_use_projectinit_gitattributes=1
        break
        ;;
    esac
  done
}

configure_gitattributes() {
  echo ""
  echo "Configuring .gitattributes..."
  if [ "$projectinit_use_projectinit_gitattributes" -eq 1 ]; then
    cp -f "${tool_dir}/src/git/generic_gitattributes/generic.gitattributes" "${project_root_dir}/.gitattributes"
  fi
  echo "  .gitattributes configured..."
}

configure_git_repository() {
  echo "Configuring git repository..."
  cd "${project_root_dir}" && git init
  echo "  Git repository configured"
}

ask_git_user_configuration() {
  echo ""
  echo "Configuring git user..."
  echo "  Your global Git username is:"
  echo "    $(git config --global user.name || echo "  not configured")"
  echo "  Your global Git user email is:"
  echo "    $(git config --global user.email || echo "  not configured")"
  # shellcheck source=./../../config/params/git_user_configuration.sh
  source "${tool_dir}/config/params/git_user_configuration.sh"
  echo "  ProjectInit configured Git username:"
  echo "    ${GIT_USER_NAME}"
  echo "  ProjectInit configured Git user email:"
  echo "    ${GIT_USER_EMAIL}"
  echo ""
  echo "Which git user would you like to use?"
  local options=("global" "ProjectInit" "custom")
  local option
  select option in "${options[@]}"; do
    case $option in
      "global" )
        projectinit_git_user_name=$(git config --global user.name)
        projectinit_git_user_email=$(git config --global user.email)
        break;;
      "ProjectInit" )
        projectinit_git_user_name="${GIT_USER_NAME}"
        projectinit_git_user_email="${GIT_USER_EMAIL}"
        break;;
      "custom" )
        echo "  Enter Git user name:"
        read -r projectinit_git_user_name
        echo "  Enter Git user email:"
        read -r projectinit_git_user_email
        break;;
    esac
  done
}

configure_git_user() {
  echo "Configuring git user name and email..."
  git config user.name "${projectinit_git_user_name}"
  git config user.email "${projectinit_git_user_email}"
  echo "  Git user name and email configured..."
}