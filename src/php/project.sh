#!/bin/bash

#######################################
# Check if the following directories exist in your project's root directory and create them if they don't:
#   - src
#   - tests
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
create_php_project_base_directories () {
  echo ""
  echo "Checking if ${project_root_dir}/src source directory exists..."
  if [ ! -d "${project_root_dir}/src" ]; then
      echo "${project_root_dir}/src/ does not exist. Creating src directory automatically..."
      mkdir "${project_root_dir}/src"
  else
      echo "${project_root_dir}/src directory exists. Skipping..."
  fi
  echo ""
  echo "Checking if ${project_root_dir}/tests source directory exists..."
  if [ ! -d "${project_root_dir}/tests" ]; then
      echo "${project_root_dir}/tests/ does not exist. Creating tests directory automatically..."
      mkdir "${project_root_dir}/tests"
  else
      echo "${project_root_dir}/tests directory exists. Skipping..."
  fi
}

#######################################
# Offer an option to create a new PHP project or continue working on the already existing one.
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
php_new_or_existing_project () {
  echo ""
  cd "${project_root_dir}" || exit 1;
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

#######################################
# Offer a dialog for picking a type of PHP project which you want to create.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
choose_php_project_type () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Choose the type of your project:"
  local php_project_type=("Composer package" "Symfony")
  select ppt in "${php_project_type[@]}"; do
    case $ppt in
      "Composer package" )
        break;;
      "Symfony" )
        # shellcheck source=./symfony/create_project.sh
        source "${tool_dir}/src/php/symfony/create_project.sh"
        configure_symfony_project
        break;;
    esac
  done
}
