#!/bin/bash

setup_dev_dockerfile() {
  cp -f "${tool_dir}/src/language/php/composer_package/container/docker/dockerfile/v1/template/dev" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
}
