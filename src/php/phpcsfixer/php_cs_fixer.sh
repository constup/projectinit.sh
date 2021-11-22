#!/bin/bash

generate_generic_phpcsfixer_v3 () {
  echo ""
  echo "Checking .php-cs-fixer.dist.php in ${PROJECT_ROOT_DIR}..."
  if [ ! -f "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php" ]; then
      echo "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php does not exist. Creating .php-cs-fixer.dist.php automatically..."
      touch "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php"
      cat "${TOOL_DIR}/src/php/phpcsfixer/generic_dist_files/v3.dist.php" >> "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php"
  else
      echo "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php exists. Skipping automatic creation..."
  fi
  echo ".php-cs-fixer.dist.php setup completed."
}

download_phpcsfixer_v3 () {
  echo ""
  wget -O php-cs-fixer.phar "https://cs.symfony.com/download/php-cs-fixer-v3.phar"
  chmod +x php-cs-fixer.phar
  echo ""
  php php-cs-fixer.phar --version
}
