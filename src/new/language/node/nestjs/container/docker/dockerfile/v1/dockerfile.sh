#!/bin/bash

setup_installer_dockerfile() {
  cp -f "${tool_dir}/src/new/language/node/nestjs/container/docker/dockerfile/v1/template/installer" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${project_root_dir}/Dockerfile"
}