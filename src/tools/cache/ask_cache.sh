#!/bin/bash

ask_cache() {
  echo ""
  echo "Select caching engine:"
  local options=("memcached")
  local option
  select option in "${options[@]}"; do
    case $option in
      "memcached" )
        if [ "${projectinit_use_memcached}" = 0 ]; then
          projectinit_tools_count=$((projectinit_tools_count + 1))
        fi
        projectinit_use_memcached=1
        # shellcheck source=./memcached/ask_memcached.sh
        source "${tool_dir}/src/tools/cache/memcached/ask_memcached.sh"
        ask_memcached_config
        break;;
    esac
  done
}