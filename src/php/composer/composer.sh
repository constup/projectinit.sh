#!/bin/bash

init_composer_v2 () {
  echo ""
  echo "Initializing Composer..."
  if [ ! -f "${PROJECT_ROOT_DIR}/composer.json" ]; then
      echo "Composer is not initialized in your project's root directory. What do you want to do?"
      component_composer_init_composer_options=("Initialize composer" "Exit this tool")
      select ccico in "${component_composer_init_composer_options[@]}"; do
          case $ccico in
              "Initialize composer" )
                  php ./composer.phar init;
                  php ./composer.phar install;
                  break;;
              "Exit this tool" )
                  exit 1;;
          esac
      done
  else
      echo "composer.json exists in ${PROJECT_ROOT_DIR}. Installing..."
      php ./composer.phar install
      echo "Composer installation completed."
  fi
  echo "Composer initialized."
}

download_latest_composer_phar () {
  echo ""
  wget -O composer.phar "https://getcomposer.org/composer.phar"
  php composer.phar self-update
  chmod +x composer.phar
  echo ""
  php composer.phar --version
}
