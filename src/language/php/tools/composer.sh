#!/bin/bash

ask_composer_location() {
  echo ""
  echo "Use globally installed composer or a local one?"
  local options=("global" "local")
  local option
  select option in "${options[@]}"; do
    case $option in
      "global" )
        projectinit_use_global_composer=1
        break;;
      "local" )
        projectinit_use_global_composer=0
        break;;
    esac
  done
}

download_latest_composer_phar() {
  echo ""
  echo "Downloading latest composer.phar..."
  cd "${project_root_dir}" || exit 1;
  wget -O composer.phar "https://getcomposer.org/composer.phar"
  php composer.phar self-update
  chmod +x composer.phar
  echo ""
  php composer.phar --version
  echo "composer.phar downloaded and ready..."
}

check_if_composer_is_initialized() {
  echo ""
  echo "Checking if composer is initialized..."
  if [ ! -f "${project_root_dir}/composer.json" ]; then
    projectinit_is_composer_initialized=0
    echo "  composer.json not found"
  else
    projectinit_is_composer_initialized=1
    echo "  composer.json found"
  fi
}

composer_init() {
  cd "${project_root_dir}" || exit 1
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php ./composer.phar init
    php ./composer.phar install
  else
    composer init
    composer install
  fi
}