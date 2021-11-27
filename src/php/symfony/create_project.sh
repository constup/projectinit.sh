#!/bin/bash

create_new_symfony5_project_web_application_composer () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  echo "Setting up a new Symfony 5 traditional web application..."
  php composer.phar create-project symfony/website-skeleton temp
  cp -a temp/. . && rm -rf temp/
  echo "New Symfony 5 Web application setup completed."
}

create_new_symfony5_project_api_composer () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  echo "Setting up a new Symfony 5 microservice, console or API application using Composer..."
  php composer.phar create-project symfony/skeleton temp
  cp -a temp/. . && rm -rf temp/
  echo "New Symfony 5 microservice, console or API application setup completed."
}
