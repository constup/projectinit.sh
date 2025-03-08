#!/bin/bash

setup_dev_entrypoint() {
  cp -f "${tool_dir}/src/language/php/composer_package/container/docker/entrypoint/v1/template/dev" "${project_root_dir}/start.sh"
  local composer_library_name
  composer_library_name=$(perl -e 'print quotemeta($ARGV[0])' "${projectinit_composer_library_name}")
  perl -pi -e "s|~~~composer library name~~~|${composer_library_name}|g" "${project_root_dir}/start.sh"
}
