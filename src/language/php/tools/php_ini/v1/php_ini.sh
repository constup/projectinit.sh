#!/bin/bash

configure_php_ini_docker_dev() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/php/usr/local/etc/php/conf.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/php/usr/local/etc/php/conf.d"
  fi

  cp -f "${tool_dir}/src/language/php/tools/php_ini/v1/template/dev" "${project_root_dir}/projectinit_docker/dev/php/usr/local/etc/php/conf.d/zz_php.ini"
}

configure_php_ini_docker_prod() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/php/usr/local/etc/php/conf.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/php/usr/local/etc/php/conf.d"
  fi

  cp -f "${tool_dir}/src/language/php/tools/php_ini/v1/template/prod" "${project_root_dir}/projectinit_docker/prod/php/usr/local/etc/php/conf.d/zz_php.ini"
}