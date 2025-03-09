#!/bin/bash

setup_installer_dockerfile() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/installer" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
}

setup_dev_dockerfile() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/dev" "${project_root_dir}/Dockerfile_dev"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile_dev"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_dockerfile_dev

  # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
  source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
  setup_memcached_dockerfile_dev

  perl -i -ne 'print unless /~~~php extension~~~/;' "${project_root_dir}/Dockerfile_dev"
}

setup_prod_dockerfile() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/template/prod" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_dockerfile_prod

  # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
  source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
  setup_memcached_dockerfile_prod

  perl -i -ne 'print unless /~~~php extension~~~/;' "${project_root_dir}/Dockerfile"
}
