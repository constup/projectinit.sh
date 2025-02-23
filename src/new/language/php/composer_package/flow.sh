#!/bin/bash

run_composer_package_flow_bare_metal() {
  # shellcheck source=../tools/composer.sh
  source "${tool_dir}/src/new/language/php/tools/composer.sh"
  check_if_composer_is_initialized
  if [ "$projectinit_is_composer_initialized" -eq 0 ]; then
    composer_init
  fi
}