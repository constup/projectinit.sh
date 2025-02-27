#!/bin/bash

setup_dev_index() {
  mkdir -p "${project_root_dir}/public"
  cp -f "${tool_dir}/src/new/language/php/composer_package/container/docker/configuration/index/v1/template/index.php" "${project_root_dir}/public/index.php"
  local composer_library_name
  composer_library_name=$(perl -e 'print quotemeta($ARGV[0])' "${projectinit_composer_library_name}")
  perl -pi -e "s/~~~library name~~~/${composer_library_name}/g" "${project_root_dir}/public/index.php"
}