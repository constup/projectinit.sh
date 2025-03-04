#!/bin/bash

setup_installer_entrypoint() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/installer" "${project_root_dir}/start.sh"
  perl -pi -e "s/~~~nestjs project name~~~/${projectinit_nestjs_project_name}/g" "${project_root_dir}/start.sh"
  perl -pi -e "s/~~~package manager~~~/${projectinit_node_package_manager}/g" "${project_root_dir}/start.sh"
  if [ "$projectinit_typescript_strict_mode" -eq 0 ]; then
    perl -pi -e "s/~~~strict typescript~~~/ --strict/g" "${project_root_dir}/start.sh"
  else
    perl -pi -e "s/~~~strict typescript~~~//g" "${project_root_dir}/start.sh"
  fi
}

setup_dev_entrypoint() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/dev" "${project_root_dir}/start_dev.sh"
}

setup_prod_entrypoint() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/template/prod" "${project_root_dir}/start.sh"
}