#!/bin/bash

ask_php_cs_fixer_config() {
  echo ""
  echo "Do you want to use default PHP CS Fixer configuration (if there is any) or ProjectInit's PHP CS Fixer configuration?"
  local options=("Use default .php-cs-fixer.dist.php" "Use ProjectInit's .php-cs-fixer.dist.php")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Use default .php-cs-fixer.dist.php" )
        projectinit_use_projectinit_phpcsfixer_dist=0
        break;;
      "Use ProjectInit's .php-cs-fixer.dist.php" )
        projectinit_use_projectinit_phpcsfixer_dist=1
        break;;
    esac
  done
}

install_php_cs_fixer_bare_metal() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php composer.phar require --dev friendsofphp/php-cs-fixer
  else
    composer require --dev friendsofphp/php-cs-fixer
  fi
}

configure_php_cs_fixer() {
  echo ""
  echo "Configuring .php-cs-fixer.dist.php..."
  if [ "$projectinit_use_projectinit_phpcsfixer_dist" -eq 1 ]; then
    cp -f "${tool_dir}/src/new/language/php/tools/style_fixer/generic_dist_files/php-cs-fixer-v3.dist.php" "${project_root_dir}/.php-cs-fixer.dist.php"
  fi
  echo "  .php-cs-fixer.dist.php configured"
}