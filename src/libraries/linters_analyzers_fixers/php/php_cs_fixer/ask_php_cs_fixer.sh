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