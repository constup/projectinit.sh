#!/bin/bash

ask_cache() {
  echo ""
  echo "Select caching engine:"
  local options=("memcached")
  local option
  select option in "${options[@]}"; do
    case $option in
      "memcached" )
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_memcached" )
        projectinit_tools_list+=( "memcached" )
        # shellcheck source=./memcached/ask_memcached.sh
        source "${tool_dir}/src/tools/cache/memcached/ask_memcached.sh"
        ask_memcached_config
        break;;
    esac
  done
}