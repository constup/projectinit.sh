#!/bin/bash

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
    cp -f \
      "${tool_dir}/src/libraries/linters_analyzers_fixers/php/php_cs_fixer/template/generic_dist_files/php-cs-fixer-v3.dist.php" \
      "${project_root_dir}/.php-cs-fixer.dist.php"
  fi
  echo "  .php-cs-fixer.dist.php configured"
}

setup_php_cs_fixer_entrypoint_installer() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  perl -pi -e "s/# composer require --dev --no-cache friendsofphp\/php-cs-fixer/  composer require --dev --no-cache friendsofphp\/php-cs-fixer/g" "${target_file}"
}

run_php_cs_fixer_integration_dev() {
  configure_php_cs_fixer
}

run_php_cs_fixer_integration_installer() {
  setup_php_cs_fixer_entrypoint_installer
}