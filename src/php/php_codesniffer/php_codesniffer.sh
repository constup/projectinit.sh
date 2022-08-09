#!/bin/bash

#######################################
# Download the latest version of PHP Code Sniffer PHAR to your project's root directory.
# Globals:
#   PROJECT_ROOT_DIR - root directory of your project
# Arguments:
#  None
#######################################
download_php_codesniffer_latest () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
  wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
  chmod +x phpcs.phar
  chmod +x phpcbf.phar
  echo ""
  php phpcs.phar --version
  php phpcbf.phar --version
}
