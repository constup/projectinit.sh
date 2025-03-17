#!/bin/bash

setup_installer_dockerfile() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/installer" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"
  perl -pi -e "s/~~~framework version~~~/${projectinit_symfony_version}/g" "${target_file}"
  if [ "$projectinit_symfony_app_type" = "full" ]; then
    perl -pi -e "s/~~~web app~~~/--webapp/g" "${target_file}"
  else
    perl -pi -e "s/~~~web app~~~//g" "${target_file}"
  fi
}

setup_dev_dockerfile() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/dev" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_dockerfile_dev

  # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
  source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
  setup_memcached_dockerfile_dev

  perl -i -ne 'print unless /~~~php extension~~~/;' "${target_file}"
}

setup_prod_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/Dockerfile"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/prod" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_dockerfile_prod

  # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
  source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
  setup_memcached_dockerfile_prod

  perl -i -ne 'print unless /~~~php extension~~~/;' "${target_file}"
}
