#!/bin/bash

setup_memcached_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose_dev.yaml"

  perl -pi -e "s/~~~tools~~~/$(<"${tool_dir}/src/tools/cache/memcached/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_memcached_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_memcached_service_name}/" "${target_file}"
}

setup_memcached_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  perl -pi -e "s/~~~tools~~~/$(<"${tool_dir}/src/tools/cache/memcached/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_memcached_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*depends_on:.*)/\1\n      - ${projectinit_memcached_service_name}/" "${target_file}"
}

