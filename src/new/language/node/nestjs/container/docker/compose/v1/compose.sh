#!/bin/bash

setup_installer_compose() {
  cp -f "${tool_dir}/src/new/language/node/nestjs/container/docker/compose/v1/template/installer" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~image name~~~/projectinit\/${projectinit_app_service_name}:installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose.yaml"
}

setup_dev_compose() {
  cp -f "${tool_dir}/src/new/language/node/nestjs/container/docker/compose/v1/template/dev" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose_dev.yaml"
}