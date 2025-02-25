#!/bin/bash

setup_installer_dockerfile() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/dockerfile/v1/template/installer" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
}

setup_dev_dockerfile() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/dockerfile/v1/template/dev" "${project_root_dir}/Dockerfile_dev"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile_dev"
  case "$projectinit_database_type" in
    "pgsql" )
      perl -pi -e "s/#pdo_pgsql/pdo_pgsql/g" "${project_root_dir}/Dockerfile_dev"
      ;;
  esac
  perl -i -ne 'print unless /#pdo_mysql/;' "${project_root_dir}/Dockerfile_dev"
  perl -i -ne 'print unless /#pdo_pgsql/;' "${project_root_dir}/Dockerfile_dev"
}

setup_prod_dockerfile() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/dockerfile/v1/template/dev" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
}
