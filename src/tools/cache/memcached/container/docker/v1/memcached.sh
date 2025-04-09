#!/bin/bash

setup_memcached_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  perl -pi -e "s/~~~container services~~~/$(<"${tool_dir}/src/tools/cache/memcached/container/docker/v1/template/compose/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_project_name}_memcached/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_project_name}_memcached:\n        condition: service_started/" "${target_file}"
}

setup_memcached_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir "${project_root_dir}/projectinit_docker/prod"
  fi

  perl -pi -e "s/~~~container services~~~/$(<"${tool_dir}/src/tools/cache/memcached/container/docker/v1/template/compose/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~memcached service name~~~/${projectinit_project_name}_memcached/g" "${target_file}"
  perl -pi -e "s/~~~memcached version~~~/${projectinit_memcached_version}/g" "${target_file}"
  perl -pi -e "s/~~~memcached host port~~~/${projectinit_memcached_host_port}/g" "${target_file}"
  perl -pi -e "s/(.*~~~main application dependencies~~~.*)/\1\n      ${projectinit_project_name}_memcached:\n        condition: service_started/" "${target_file}"
}

setup_memcached_dockerfile_dev() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        memcached \\\\/g" "${target_file}"
}

setup_memcached_dockerfile_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/Dockerfile"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir "${project_root_dir}/projectinit_docker/prod"
  fi

  perl -pi -e "s/(.*~~~php extension~~~.*)/\1\n        memcached \\\\/g" "${target_file}"
}

run_memcached_integration_dev() {
  setup_memcached_dockerfile_dev
  setup_memcached_docker_compose_dev
}

run_memcached_integration_prod() {
  setup_memcached_dockerfile_prod
  setup_memcached_docker_compose_prod
}
