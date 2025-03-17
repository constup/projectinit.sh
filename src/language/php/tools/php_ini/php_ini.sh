#!/bin/bash

configure_php_ini_docker_dev() {
  if [ ! -d "${project_root_dir}/projectinit_docker/php" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/php"
  fi
  touch "${project_root_dir}/projectinit_docker/php/zz_dev_php.ini"
  echo "; Custom php.ini settings set up on the host" >> "${project_root_dir}/projectinit_docker/php/zz_dev_php.ini"
}

configure_php_ini_docker_prod() {
  if [ ! -d "${project_root_dir}/projectinit_docker/php" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/php"
  fi
  touch "${project_root_dir}/projectinit_docker/php/zz_prod_php.ini"
  echo "; Custom php.ini settings set up on the host" >> "${project_root_dir}/projectinit_docker/php/zz_prod_php.ini"
}