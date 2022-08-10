#!/bin/bash

#######################################
# Download the latest version of PHP Documentor's PHAR to your project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_latest_php_documentor () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget https://phpdoc.org/phpDocumentor.phar
  chmod +x phpDocumentor.phar
  echo ""
  php phpDocumentor.phar --version
}
