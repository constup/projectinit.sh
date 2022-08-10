#!/bin/bash

#######################################
# Copy a generic PHP CS Fixer v3.x configuration file available in ./generic_configuration_files subdirectory to your
# project's root directory.
# Globals:
#   project_root_dir
#   tool_dir
# Arguments:
#  None
#######################################
generate_generic_phpcsfixer_v3 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  echo "Checking .php-cs-fixer.dist.php in ${project_root_dir}..."
  if [ ! -f "${project_root_dir}/.php-cs-fixer.dist.php" ]; then
      echo "${project_root_dir}/.php-cs-fixer.dist.php does not exist. Creating .php-cs-fixer.dist.php automatically..."
      touch "${project_root_dir}/.php-cs-fixer.dist.php"
      cat "${tool_dir}/src/php/phpcsfixer/generic_dist_files/v3.dist.php" >> "${project_root_dir}/.php-cs-fixer.dist.php"
  else
      echo "${project_root_dir}/.php-cs-fixer.dist.php exists. Skipping automatic creation..."
  fi
  echo ".php-cs-fixer.dist.php setup completed."
}

#######################################
# Download PHP Code Style Fixer v3.x to you project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_phpcsfixer_v3 () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget -O php-cs-fixer.phar "https://cs.symfony.com/download/php-cs-fixer-v3.phar"
  chmod +x php-cs-fixer.phar
  echo ""
  php php-cs-fixer.phar --version
}
