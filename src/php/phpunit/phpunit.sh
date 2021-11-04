#!/bin/bash

generate_generic_phpunit_configuration_file_v9 () {
  echo ""
  echo "Checking phpunit.xml.dist in ${PROJECT_ROOT_DIR}..."
  if [ ! -f "${PROJECT_ROOT_DIR}/phpunit.xml.dist" ]; then
      echo "${PROJECT_ROOT_DIR}/phpunit.xml.dist does not exist. Creating phpunit.xml.dist automatically..."
      touch "${PROJECT_ROOT_DIR}/phpunit.xml.dist"
      cat "${TOOL_DIR}/src/php/phpunit/generic_configuration_files/v9.xml.dist" >> "${PROJECT_ROOT_DIR}/phpunit.xml.dist"
  else
      echo "${PROJECT_ROOT_DIR}/phpunit.xml.dist exists. Skipping automatic creation..."
  fi
  echo "phpunit.xml.dist setup completed."
}

download_phpunit_v9 () {
  echo ""
  wget -O phpunit.phar https://phar.phpunit.de/phpunit-9.phar
  chmod +x phpunit.phar
  echo ""
  php phpunit.phar --version
}
