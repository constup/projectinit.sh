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
        local symfony_version
        source ${tool_dir}/src/php/symfony/create_project.sh
        echo "Select Symfony version. Note: the latest minor version will be used."
        local sym_ver=("Symfony 5" "Symfony 6" "Symfony 7" "Custom")
        select sv in "${sym_ver[@]}"; do
          case $sv in
            "Symfony 5" )
              echo ""
              echo "Symfony 5.4 will be used."
              echo "  - Release date: November 2021."
              echo "  - End of bug fixes: November 2024."
              echo "  - End of security fixes: February 2029."
              echo "  - Requires PHP 7.2.5 or higher."
              echo ""
              symfony_version="5.4.x"
              break;;
            "Symfony 6" )
              echo ""
              echo "Symfony 6.4 will be used."
              echo "  - Release date: November 2023."
              echo "  - End of bug fixes: November 2026."
              echo "  - End of security fixes: February 2027."
              echo "  - Requires PHP 8.1.0 or higher."
              echo ""
              symfony_version="6.4.x"
              break;;
            "Symfony 7" )
              echo ""
              echo "Symfony 7.2 will be used."
              echo "  - Release date: November 2024."
              echo "  - End of support: July 2025."
              echo "  - Requires PHP 8.2.0 or higher."
              echo ""
              symfony_version="7.2.x"
              break;;
            "Custom" )
              echo ""
              echo "Manually enter your desired Symfony version (format: 7.1):"
              read -r -e symfony_version
              symfony_version="${symfony_version}.x"
              break;;
          esac
        done

        echo ""
        echo "Choose application type:"
        local app_type
        local app_type_options=("Web application with frontend" "CLI or API application")
        select ato in "${app_type_options[@]}"; do
          case $ato in
            "Web application with frontend" )
              app_type="full"
              break;;
            "CLI or API application" )
              app_type="api"
              break;;
          esac
        done
        create_symfony_project $symfony_version $app_type "composer"
        break;;
    esac
  done
}
