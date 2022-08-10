#!/bin/bash

#######################################
# Download the latest version of PHP Code Sniffer PHAR to your project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_php_codesniffer_latest () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
  wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
  chmod +x phpcs.phar
  chmod +x phpcbf.phar
  echo ""
  php phpcs.phar --version
  php phpcbf.phar --version
}
