#!/bin/bash

print_memcached_info_print() {
  # shellcheck source=../../../../../general.sh
  source "${tool_dir}/src/general.sh"

  if in_array "memcached" "${projectinit_tools_list[@]}"; then
    echo "| Memcached"
    echo "|------------------------------"
    if [ "${projectinit_container_type}" = "docker" ]; then
      echo "| Docker service: ${projectinit_project_name}_memcached"
    fi
    echo "| Memcached version: ${projectinit_memcached_version}"
    echo "| Memcached host port: ${projectinit_memcached_host_port}"
    echo "|------------------------------"
  fi
}