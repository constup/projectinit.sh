#!/bin/bash

setup_composer_documentation() {
  if [ ! -d "${project_root_dir}/doc/projectinit" ]; then
    mkdir -p "${project_root_dir}/doc/projectinit"
  fi

  cp -f "${tool_dir}/src/language/php/composer_package/container/docker/doc/PROJECTINIT_README_v1.adoc" "${project_root_dir}/doc/projectinit/index.adoc"
}