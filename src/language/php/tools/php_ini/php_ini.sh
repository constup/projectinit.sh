#!/bin/bash

configure_php_ini_docker_dev() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev"
  fi
  touch "${project_root_dir}/projectinit_docker/dev/zz_php.ini"
  echo "; Custom php.ini settings set up on the host" >> "${project_root_dir}/projectinit_docker/dev/zz_php.ini"
}

configure_php_ini_docker_prod() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi
  touch "${project_root_dir}/projectinit_docker/prod/zz_php.ini"
  echo "; Custom php.ini settings set up on the host" >> "${project_root_dir}/projectinit_docker/prod/zz_php.ini"
}