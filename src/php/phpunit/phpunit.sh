#!/bin/bash

#######################################
# Copy a generic PHPUnit v9.x configuration file available in ./generic_configuration_files subdirectory to your
# project's root directory.
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
generate_generic_phpunit_configuration_file_v9 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Checking phpunit.xml.dist in ${project_root_dir}..."
  if [ ! -f "${project_root_dir}/phpunit.xml.dist" ]; then
      echo "${project_root_dir}/phpunit.xml.dist does not exist. Creating phpunit.xml.dist automatically..."
      touch "${project_root_dir}/phpunit.xml.dist"
      cat "${tool_dir}/src/php/phpunit/generic_configuration_files/v9.xml.dist" >> "${project_root_dir}/phpunit.xml.dist"
  else
      echo "${project_root_dir}/phpunit.xml.dist exists. Skipping automatic creation..."
  fi
  echo "phpunit.xml.dist setup completed."
}

#######################################
# Download PHPUnit v9.x PHAR to your project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_phpunit_v9 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget -O phpunit.phar https://phar.phpunit.de/phpunit-9.phar
  chmod +x phpunit.phar
  echo ""
  php phpunit.phar --version
}

#######################################
# Copy a generic PHPUnit v10.x configuration file available in ./generic_configuration_files subdirectory to your
# project's root directory.
# Globals:
#   project_root_dir - root directory of your project
#   tool_dir         - root directory of projectinit.sh
# Arguments:
#  None
#######################################
generate_generic_phpunit_configuration_file_v10 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Checking phpunit.xml.dist in ${project_root_dir}..."
  if [ ! -f "${project_root_dir}/phpunit.xml.dist" ]; then
      echo "${project_root_dir}/phpunit.xml.dist does not exist. Creating phpunit.xml.dist automatically..."
      touch "${project_root_dir}/phpunit.xml.dist"
      cat "${tool_dir}/src/php/phpunit/generic_configuration_files/v10.xml.dist" >> "${project_root_dir}/phpunit.xml.dist"
  else
      echo "${project_root_dir}/phpunit.xml.dist exists. Skipping automatic creation..."
  fi
  echo "phpunit.xml.dist setup completed."
}

#######################################
# Download PHPUnit v10.x PHAR to your project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_phpunit_v10 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget -O phpunit.phar https://phar.phpunit.de/phpunit-10.phar
  chmod +x phpunit.phar
  echo ""
  php phpunit.phar --version
}

#######################################
# Pick and install PHPUnit version
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
pick_phpunit_version () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Pick PHPUnit version:"
  local php_unit_version=("PHPUnit 9" "PHPUnit 10")
  select puv in "${php_unit_version[@]}"; do
    case $puv in
      "PHPUnit 9" )
        generate_generic_phpunit_configuration_file_v9
        download_phpunit_v9
        break;;
      "PHPUnit 10" )
        generate_generic_phpunit_configuration_file_v10
        download_phpunit_v10
        break;;
    esac
  done
}
