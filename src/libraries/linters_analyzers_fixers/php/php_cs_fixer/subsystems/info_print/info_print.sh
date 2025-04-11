#!/bin/bash

print_php_cs_fixer_info_print() {
  # shellcheck source=../../../../../../general.sh
  source "${tool_dir}/src/general.sh"

  if in_array "php_cs_fixer" "${projectinit_libraries_list[@]}"; then
    echo "| PHP CS Fixer"
    echo "|------------------------------"
    if [ "$projectinit_use_projectinit_phpcsfixer_dist" -eq 0 ]; then
      echo "| Configuration: Default .php-cs-fixer.dist.php is used"
    else
      echo "| Configuration: ProjectInit's .php-cs-fixer.dist.php is used"
    fi
    echo "|------------------------------"
  fi
}