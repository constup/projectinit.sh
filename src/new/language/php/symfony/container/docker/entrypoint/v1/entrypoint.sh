#!/bin/bash

setup_installer_entrypoint() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/template/installer" "${project_root_dir}/start.sh"
  perl -pi -e "s/~~~framework version~~~/${projectinit_symfony_version}/g" "${project_root_dir}/start.sh"
  if [ "$projectinit_symfony_app_type" = "full" ]; then
    perl -pi -e "s/~~~web app~~~/--webapp/g" "${project_root_dir}/start.sh"
  else
    perl -pi -e "s/~~~web app~~~//g" "${project_root_dir}/start.sh"
  fi
  local phpunit_string
  phpunit_string=$(perl -e 'print quotemeta($ARGV[0])' "$projectinit_phpunit_version")
  perl -pi -e "s/~~~unit testing~~~/ ${phpunit_string}/g" "${project_root_dir}/start.sh"
  if [ ! "$projectinit_database_type" = "no database" ]; then
    perl -pi -e "s/#composer require symfony\/orm-pack/composer require symfony\/orm-pack/g" "${project_root_dir}/start.sh"
  fi
}

setup_dev_entrypoint() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/template/dev" "${project_root_dir}/start_dev.sh"
  if [ "${projectinit_database_type}" = "no database" ]; then
    perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start_dev.sh"
  else
    perl -i -pe "s/~~~database creation and migration~~~/$(<"${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/template/database" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/start_dev.sh"
  fi
}

setup_prod_entrypoint() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/template/prod" "${project_root_dir}/start.sh"
  if [ "${projectinit_database_type}" = "no database" ]; then
    perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start.sh"
  else
    perl -i -pe "s/~~~database creation and migration~~~/$(<"${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/template/database" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/start.sh"
  fi
}
