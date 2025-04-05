#!/bin/bash

setup_memcached_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  perl -pi -e "s/~~~tools~~~/$(<"${tool_dir}/src/tools/cache/memcached/container/docker/v1/template/compose/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_memcached_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_memcached_service_name}:\n        condition: service_started/" "${target_file}"
}

setup_memcached_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir "${project_root_dir}/projectinit_docker/prod"
  fi

  perl -pi -e "s/~~~tools~~~/$(<"${tool_dir}/src/tools/cache/memcached/container/docker/v1/template/compose/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_memcached_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_memcached_service_name}:\n        condition: service_started/" "${target_file}"
}

setup_memcached_dockerfile_dev() {
  if [ "${projectinit_use_memcached}" -eq 1 ]; then
    local target_file
    target_file="${project_root_dir}/Dockerfile"

    perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        memcached \\\\/g" "${target_file}"
  fi
}

setup_memcached_dockerfile_prod() {
  if [ "${projectinit_use_memcached}" -eq 1 ]; then
    local target_file
    target_file="${project_root_dir}/projectinit_docker/prod/Dockerfile"
    if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
      mkdir "${project_root_dir}/projectinit_docker/prod"
    fi

    perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        memcached \\\\/g" "${target_file}"
  fi
}
