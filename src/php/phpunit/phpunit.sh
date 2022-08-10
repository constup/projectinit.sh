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
