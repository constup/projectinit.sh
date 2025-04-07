#!/bin/bash

init_integrations() {
  declare -a projectinit_tools_list=()
  declare -a projectinit_main_app_dependencies_list=()
}

run_integrations() {
  local integrations_type
  integrations_type="$1"

  # shellcheck source=../../general.sh
  source "${tool_dir}/src/general.sh"

  if in_array "memcached" "${projectinit_tools_list[@]}"; then
    # shellcheck source=../../tools/cache/memcached/container/docker/v1/memcached.sh
    source "${tool_dir}/src/tools/cache/memcached/container/docker/v1/memcached.sh"
    case $integrations_type in
      "dev" ) run_memcached_integration_dev; break;;
      "prod" ) run_memcached_integration_prod; break;;
      "installer" ) break;;
    esac
  fi
}