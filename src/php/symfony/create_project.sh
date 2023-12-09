#!/bin/bash

#######################################
# Create a new Symfony 5 Web application.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_new_symfony5_project_web_application_composer () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Setting up a new Symfony 5 traditional web application..."
  php composer.phar create-project symfony/website-skeleton temp
  cp -a temp/. . && rm -rf temp/
  echo "New Symfony 5 Web application setup completed."
}

#######################################
# Create a new Symfony 5 Console or API application.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_new_symfony5_project_api_composer () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Setting up a new Symfony 5 microservice, console or API application using Composer..."
  php composer.phar create-project symfony/skeleton temp
  cp -a temp/. . && rm -rf temp/
  echo "New Symfony 5 microservice, console or API application setup completed."
}

#######################################
# Create a new Symfony 6 Web Application.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_new_symfony6_project_web_application_composer () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Setting up a new Symfony 6 traditional web application..."
  php composer.phar create-project symfony/skeleton:"6.4.*" temp
  cp -a temp/. . && rm -rf temp/
  php composer.phar require webapp
  echo "New Symfony 6 Web application setup completed."
}

#######################################
# Create a new Symfony 6 Console or API application.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_new_symfony6_project_api_composer () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Setting up a new Symfony 6 microservice, console or API application using Composer..."
  php composer.phar create-project symfony/skeleton:"6.4.*" temp
  cp -a temp/. . && rm -rf temp/
  echo "New Symfony 6 microservice, console or API application setup completed."
}
