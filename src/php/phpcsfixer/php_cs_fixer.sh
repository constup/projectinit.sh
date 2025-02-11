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
      cp "${tool_dir}"/src/php/phpcsfixer/generic_dist_files/v3.dist.php "${project_root_dir}"/.php-cs-fixer.dist.php
  else
      echo "${project_root_dir}/.php-cs-fixer.dist.php exists. Do you want to keep it, or replace it with Projectinit.sh generic .gitignore?"
      local keep_or_replace_phpcsfixer=("Keep the original" "Replace it with generic")
      select korp in "${keep_or_replace_phpcsfixer[@]}"; do
        case $korp in
          "Keep the original" )
            echo "Keeping the original PHP CS Fixer configuration..."
            break;;
          "Replace it with generic" )
            echo "Replacing the existing PHP CS Fixer configuration with generic one..."
            cat "${tool_dir}"/src/php/phpcsfixer/generic_dist_files/v3.dist.php > "${project_root_dir}"/.php-cs-fixer.dist.php
            break;;
        esac
      done
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
