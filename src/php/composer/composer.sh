#!/bin/bash

#######################################
# Check if `composer.json` exists in your project's root directory.
# If it doesn't, run composer initialization.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
init_composer_v2 () {
  echo ""
  echo "Initializing Composer..."
  if [ ! -f "${project_root_dir}/composer.json" ]; then
      echo "Composer is not initialized in your project's root directory. What do you want to do?"
      local component_composer_init_composer_options=("Initialize composer" "Exit this tool")
      select ccico in "${component_composer_init_composer_options[@]}"; do
          case $ccico in
              "Initialize composer" )
                 cd "${project_root_dir}" || exit 1;
                  php ./composer.phar init;
                  php ./composer.phar install;
                  break;;
              "Exit this tool" )
                  exit 1;;
          esac
      done
  else
      echo "composer.json exists in ${project_root_dir}. Installing..."
      php ./composer.phar install
      echo "Composer installation completed."
  fi
  echo "Composer initialized."
}

#######################################
# Download the latest version of Composer to your project's root directory.
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
download_latest_composer_phar () {
  echo ""
  cd "${project_root_dir}" || exit 1;
  wget -O composer.phar "https://getcomposer.org/composer.phar"
  php composer.phar self-update
  chmod +x composer.phar
  echo ""
  php composer.phar --version
}
