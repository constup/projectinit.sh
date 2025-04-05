#!/bin/bash

setup_installer_entrypoint() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/template/installer" "${target_file}"
  perl -pi -e "s/~~~framework version~~~/${projectinit_symfony_version}/g" "${target_file}"
  local phpunit_string
  phpunit_string=$(perl -e 'print quotemeta($ARGV[0])' "$projectinit_phpunit_version")
  perl -pi -e "s/~~~unit testing~~~/ ${phpunit_string}/g" "${target_file}"
  case "$projectinit_database_type" in
    "mysql"|"mariadb"|"percona"|"pgsql" )
      perl -pi -e "s/#composer require --no-cache symfony\/orm-pack/composer require --no-cache symfony\/orm-pack/g" "${target_file}"
      ;;
    "mongodb" )
      perl -pi -e "s/#composer require --no-cache doctrine\/mongodb-odm-bundle/composer require --no-cache doctrine\/mongodb-odm-bundle/g" "${target_file}"
      ;;
  esac
}

setup_dev_entrypoint() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/template/dev" "${target_file}"
  case "${projectinit_database_type}" in
    "mysql"|"mariadb"|"percona"|"pgsql" )
      perl -i -pe "s/~~~database creation and migration~~~/$(<"${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/template/doctrine" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
      ;;
    "mongodb" )
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${target_file}"
      ;;
    * )
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${target_file}"
      ;;
  esac
}

setup_prod_entrypoint() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/start.sh"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/template/prod" "${target_file}"
  case "${projectinit_database_type}" in
    "mysql"|"mariadb"|"percona"|"pgsql" )
      perl -i -pe "s/~~~database creation and migration~~~/$(<"${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/template/doctrine" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
      ;;
    "mongodb" )
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${target_file}"
      ;;
    * )
      perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${target_file}"
      ;;
  esac
}
