#!/bin/bash

print_project_configuration() {
  echo ""
  echo "Your project will be set up with the following options:"
  echo "┌---------------------------------------------------------------------"
  print_directory_block
  print_git_block
  print_container_block
  print_tech_stack_block
  echo "Press Enter to continue..."
  read -r
}

print_directory_block() {
  echo "| Directory: ${project_root_dir}                                      "
  if [ "${projectinit_new_project}" -eq 1 ]; then
    echo "| New project will be created in the directory."
  else
    echo "| An existing project will be set up in the directory."
    if [[ -v projectinit_repo_url ]]; then
      echo "| Repository to be cloned: ${projectinit_repo_url}"
    else
      echo "| No repository will be cloned."
      echo "| You are using ProjectInit on an already cloned repository."
    fi
  fi
  echo "|---------------------------------------------------------------------"
}

print_git_block() {
  echo "|                                Git"
  echo "|---------------------------------------------------------------------"
  echo "| User name: ${projectinit_git_user_name}"
  echo "| User email: ${projectinit_git_user_email}"
  if [ "${projectinit_use_projectinit_gitignore}" -eq 1 ]; then
    echo "| ProjectInit's .gitignore will be used."
  else
    echo "| Your project's default .gitignore will be used."
  fi
  echo "|---------------------------------------------------------------------"
}

print_container_block() {
  echo "|                                Container"
  echo "|---------------------------------------------------------------------"
  if [ "${projectinit_container_type}" = "none" ]; then
    echo "| No container used."
  else
    echo "| Container type: ${projectinit_container_type}"
  fi
  echo "|---------------------------------------------------------------------"
}

print_tech_stack_block() {
  echo "|                                Tech stack"
  echo "|---------------------------------------------------------------------"
  echo "| Language or base technology: ${projectinit_language}"
  case $projectinit_language in
    "php" )
      print_php_tech_stack
      ;;
    "node" )
      ;;
  esac
  echo "|---------------------------------------------------------------------"
}

print_php_tech_stack() {
  # Composer is set up inside containers, there is no need for composer on metal.
  if [ "${projectinit_container_type}" = "none" ]; then
    if [ "$projectinit_use_global_composer" -eq 0 ]; then
      echo "| Composer: local composer.phar"
    else
      echo "| Composer: globally installed composer"
    fi
  fi
  echo "| Project type: ${projectinit_php_project_type}"
  case $projectinit_php_project_type in
    "symfony" )
      echo "| Symfony version: ${projectinit_symfony_version}"
      case $projectinit_symfony_app_type in
        "full" )
          echo "| Application type: Full web application with frontend"
          ;;
        "api" )
          echo "| Application type: API or CLI application"
          ;;
      esac
  esac
  echo "| PHPUnit version: ${projectinit_phpunit_version}"
  echo "| CS Fixer: PHP CS Fixer"
}