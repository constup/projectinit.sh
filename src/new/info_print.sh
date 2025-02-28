#!/bin/bash

print_project_configuration() {
  echo ""
  echo "Your project will be set up with the following options:"
  echo "┌---------------------------------------------------------------------"
  print_directory_block
  print_git_block
  print_container_block
  print_tech_stack_block
  if [[ -v projectinit_database_type ]]; then
    print_database_block
  fi
  echo "Press Enter to continue..."
  read -r
}

print_directory_block() {
  echo "| Directory: ${project_root_dir}                                      "
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
    case "${projectinit_container_type}" in
      "docker" )
        echo "| Language or technology: ${projectinit_language}"
        echo "| Version: ${projectinit_language_version}"
        echo "| Application Docker service: ${projectinit_app_service_name}"
        echo "| Application host port: ${projectinit_app_host_port}"
        ;;
    esac
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
      print_node_tech_stack
      ;;
  esac
  echo "|---------------------------------------------------------------------"
}

print_php_tech_stack() {
  if [ "${projectinit_container_type}" = "none" ]; then
    if [ "$projectinit_use_global_composer" -eq 0 ]; then
      echo "| Composer: local composer.phar"
    else
      echo "| Composer: globally installed composer"
    fi
  fi
  echo "| Project type: ${projectinit_php_project_type}"
  case $projectinit_php_project_type in
    "composer" )
      echo "| Composer library name: ${projectinit_composer_library_name}"
      ;;
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
  if [ ! "$projectinit_phpunit_version" = "symfony/test-pack" ]; then
    if [ "$projectinit_use_projectinit_phpunit_dist" -eq 0 ]; then
      echo "| Default phpunit.xml.dist will be used"
    else
      echo "| ProjectInit's phpunit.xml.dist will be used"
    fi
  else
      echo "| Symfony Test Pack was used. Configure phpunit.xml.dist manually"
  fi
  echo "| CS Fixer: PHP CS Fixer"
  if [ "$projectinit_use_projectinit_phpcsfixer_dist" -eq 0 ]; then
    echo "| Default .php-cs-fixer.dist.php will be used"
  else
    echo "| ProjectInit's .php-cs-fixer.dist.php will be used"
  fi
}

print_node_tech_stack() {
  echo "| Project type: ${projectinit_node_project_type}"
  echo "| Package manager: ${projectinit_node_package_manager}"
  case $projectinit_node_project_type in
    "nestjs" )
      echo "| NestJS version: ${projectinit_nestjs_version}"
      ;;
  esac
}

print_database_block() {
  echo "|                                Database"
  echo "|---------------------------------------------------------------------"
  echo "| Database engine: ${projectinit_database_type}"
  if [ ! "$projectinit_database_type" = "no database" ]; then
    echo "| Version: ${projectinit_database_version}"
    echo "| Database name: ${projectinit_database_name}"
    echo "| Host port: ${projectinit_database_host_port}"
    if [ "$projectinit_container_type" = "docker" ]; then
      echo "| Docker service name: ${projectinit_database_service_name}"
    fi
  fi
  echo "|---------------------------------------------------------------------"
}