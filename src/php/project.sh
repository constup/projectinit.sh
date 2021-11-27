#!/bin/bash

php_new_or_existing_project () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  source ${TOOL_DIR}/src/php/symfony/create_project.sh
  echo "Do you wish to:"
  local new_or_existing_project=("NEW - Create a new PHP project" "EXISTING - Continue working on an existing PHP project")
  select noep in "${new_or_existing_project[@]}"; do
    case $noep in
      "NEW - Create a new PHP project" )
        choose_php_project_type
        break;;
      "EXISTING - Continue working on an existing PHP project" )
        break;;
    esac
  done
}

choose_php_project_type () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  echo "Choose the type of your project:"
  local php_project_type=("Composer package" "Symfony 5 traditional web application" "Symfony 5 microservice, console or API application")
  select ppt in "${php_project_type[@]}"; do
    case $ppt in
      "Composer package" )
        break;;
      "Symfony 5 traditional web application" )
        create_new_symfony5_project_web_application_composer
        break;;
      "Symfony 5 microservice, console or API application" )
        create_new_symfony5_project_api_composer
        break;;
    esac
  done
}
