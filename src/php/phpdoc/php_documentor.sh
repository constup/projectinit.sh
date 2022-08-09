#!/bin/bash

#######################################
# Download the latest version of PHP Documentor's PHAR to your project's root directory.
# Globals:
#   PROJECT_ROOT_DIR - root directory of your project
# Arguments:
#  None
#######################################
download_latest_php_documentor () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  wget https://phpdoc.org/phpDocumentor.phar
  chmod +x phpDocumentor.phar
  echo ""
  php phpDocumentor.phar --version
}
