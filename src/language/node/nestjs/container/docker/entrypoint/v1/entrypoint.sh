#!/bin/bash

setup_installer_entrypoint() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/installer" "${target_file}"
  perl -pi -e "s/~~~nestjs project name~~~/${projectinit_project_name}/g" "${target_file}"
  perl -pi -e "s/~~~package manager~~~/${projectinit_node_package_manager}/g" "${target_file}"
  if [ "$projectinit_typescript_strict_mode" -eq 0 ]; then
    perl -pi -e "s/~~~strict typescript~~~/ --strict/g" "${target_file}"
  else
    perl -pi -e "s/~~~strict typescript~~~//g" "${target_file}"
  fi
}

setup_dev_entrypoint() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/dev" "${target_file}"
}

setup_prod_entrypoint() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/start.sh"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/prod" "${target_file}"
}