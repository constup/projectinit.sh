#!/bin/bash

ask_cache() {
  echo ""
  echo "Select caching engine:"
  local options=("memcached")
  local option
  select option in "${options[@]}"; do
    case $option in
      "memcached" )
        projectinit_use_memcached=1
        # shellcheck source=./memcached/ask_memcached.sh
        source "${tool_dir}/src/tools/cache/memcached/ask_memcached.sh"
        ask_memcached_config
        break;;
    esac
  done
}