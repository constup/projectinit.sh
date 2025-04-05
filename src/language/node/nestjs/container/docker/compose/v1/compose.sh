#!/bin/bash

setup_installer_compose() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/compose/v1/template/installer" "${target_file}"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}_installer/g" "${target_file}"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}_installer/g" "${target_file}"
  perl -pi -e "s/~~~image name~~~/projectinit\/${projectinit_app_service_name}:installer/g" "${target_file}"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${target_file}"
}

setup_dev_compose() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/compose/v1/template/dev" "${target_file}"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${target_file}"
}

setup_prod_compose() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/compose/v1/template/prod" "${target_file}"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${target_file}"

  if [ "${projectinit_compose_has_root_volumes}" = 1 ]; then
    perl -pi -e "s/~~~root volumes~~~/volumes:/g" "${target_file}"
  else
    perl -pi -e "s/~~~root volumes~~~//g" "${target_file}"
  fi
}