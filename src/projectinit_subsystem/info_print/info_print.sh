#!/bin/bash

print_project_configuration() {
  echo ""
  echo "Project identity card:"
  echo "┌---------------------------------------------------------------------"
  print_directory_block
  print_git_block
  print_container_block
  print_tech_stack_block
  if [[ -v projectinit_database_type ]]; then
    print_database_block
  fi
  print_tools_block
}

print_directory_block() {
  echo "| Directory: ${project_root_dir}"
  echo "| Project name: ${projectinit_project_name}"
  echo "|---------------------------------------------------------------------"
}

print_git_block() {
  echo "|                                Git"
  echo "|---------------------------------------------------------------------"
  echo "| User name: ${projectinit_git_user_name}"
  echo "| User email: ${projectinit_git_user_email}"
  if [ "${projectinit_use_projectinit_gitignore}" -eq 1 ]; then
    echo "| ProjectInit's .gitignore is used."
  else
    echo "| Your project's default .gitignore is used."
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
        if [ "${projectinit_build_containers}" -eq 1 ]; then
          echo "| Containers are built automatically by ProjectInit"
        else
          echo "| Containers are not build. Use 'docker compose --env-file .env.docker build' to build."
        fi
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
  echo "| Project type: ${projectinit_project_type}"
  case $projectinit_project_type in
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
      echo "| Default phpunit.dist.xml is used"
    else
      echo "| ProjectInit's phpunit.dist.xml is used"
    fi
  else
      echo "| Symfony Test Pack was used. Configure phpunit.dist.xml manually"
  fi
  echo "| CS Fixer: PHP CS Fixer"
  if [ "$projectinit_use_projectinit_phpcsfixer_dist" -eq 0 ]; then
    echo "| Default .php-cs-fixer.dist.php is used"
  else
    echo "| ProjectInit's .php-cs-fixer.dist.php is used"
  fi
}

print_node_tech_stack() {
  echo "| Project type: ${projectinit_project_type}"
  echo "| Package manager: ${projectinit_node_package_manager}"
  case $projectinit_project_type in
    "nestjs" )
      echo "| NestJS version: ${projectinit_nestjs_version}"
      ;;
  esac
}

print_database_block() {
  echo "|                                Database"
  echo "|---------------------------------------------------------------------"
  if [[ "$projectinit_container_type" = "docker"  && "$projectinit_database_type" != "no database" ]]; then
    echo "| Docker service: ${projectinit_database_service_name}"
  fi
  echo "| Database engine: ${projectinit_database_type}"
  if [ ! "$projectinit_database_type" = "no database" ]; then
    echo "| Version: ${projectinit_database_version}"
    if [ ! -z "${projectinit_orm}" ]; then
      echo "| ORM: ${projectinit_orm}"
    fi
    echo "| Database name: ${projectinit_database_name}"
    echo "| Host port: ${projectinit_database_host_port}"
    if [[ -v projectinit_database_x_plugin_host_port ]]; then
      echo "| X Protocol host port: ${projectinit_database_x_plugin_host_port}"
    fi
  fi
  echo "|---------------------------------------------------------------------"
}

print_tools_block() {
  echo "|                                Tools"
  echo "|---------------------------------------------------------------------"
  if [ "${projectinit_tools_count}" = 0 ]; then
    echo "| No additional tools are configured."
  else
    if [ "${projectinit_use_memcached}" = 1 ]; then
      echo "| Memcached"
      echo "|------------------------------"
      if [ "${projectinit_container_type}" = "docker" ]; then
        echo "| Docker service: ${projectinit_memcached_service_name}"
      fi
      echo "| Memcached version: ${projectinit_memcached_version}"
      echo "| Memcached host port: ${projectinit_memcached_host_port}"
      echo "|------------------------------"
    fi
  fi
  echo "|---------------------------------------------------------------------"
}

ask_generate_project_id_card_text() {
  local options

  while true; do
    read -r -p "Do you want to save this Project ID card as a text file inside your project (y/n)?" options
    case "${options,,}" in
      "y"|"yes"|"yup"|"yeah"|"1" ) projectinit_generate_id_card_text=1; break;;
      "n"|"no"|"nope"|"2" ) projectinit_generate_id_card_text=0; break;;
      * ) echo "Invalid input. Asking again..." ;;
    esac
  done
}

generate_project_id_card_text() {
  if [ "${projectinit_generate_id_card_text}" = 1 ]; then
    print_project_configuration >> "${project_root_dir}/projectinit_id_card.txt"
  fi
}