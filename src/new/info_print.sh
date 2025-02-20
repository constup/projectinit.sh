#!/bin/bash

print_project_configuration() {
  echo ""
  echo "Your project will be set up with the following options:"
  echo "┌---------------------------------------------------------------------"
  echo "| Directory: ${project_root_dir}                                      "
  echo "|---------------------------------------------------------------------"
  echo "|                                Git"
  echo "|---------------------------------------------------------------------"
  if [ "${projectinit_is_git_repo}" -eq 0 ]; then
    echo "| Directory is not a git directory. Git will be initialized."
  else
    echo "| Directory is a git directory. Git configuration will not be changed."
  fi
  echo "| User name: ${projectinit_git_user_name}"
  echo "| User email: ${projectinit_git_user_email}"
  if [ "${projectinit_use_projectinit_gitignore}" -eq 1 ]; then
    echo "| ProjectInit's .gitignore will be used."
  else
    echo "| Your project's default .gitignore will be used."
  fi
  echo "|---------------------------------------------------------------------"
  echo "Press Enter to continue..."
  read -r
}