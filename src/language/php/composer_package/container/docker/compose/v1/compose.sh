#!/bin/bash

setup_dev_compose() {
  local target_file
  target_file="${project_root_dir}/compose_dev.yaml"

  cp -f "${tool_dir}/src/language/php/composer_package/container/docker/compose/v1/template/dev" "${target_file}"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${target_file}"
}