#!/bin/bash

setup_mongodb_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"
  
  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/mongodb/container/docker/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~root volumes~~~/~~~root volumes~~~\n  ${projectinit_database_service_name}_volume:/g" "${target_file}"

  mkdir -p "${project_root_dir}/compose_secrets"
  touch "${project_root_dir}/compose_secrets/mongodb_root_password.txt"
  echo "${projectinit_database_password}" >> "${project_root_dir}/compose_secrets/mongodb_root_password.txt"
  touch "${project_root_dir}/compose_secrets/mongodb_database.txt"
  echo "${projectinit_database_name}" >> "${project_root_dir}/compose_secrets/mongodb_database.txt"
  touch "${project_root_dir}/compose_secrets/mongodb_root_user.txt"
  echo "${projectinit_database_user}" >> "${project_root_dir}/compose_secrets/mongodb_root_user.txt"
  
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mongodb/docker-entrypoint-initdb.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mongodb/docker-entrypoint-initdb.d"
  fi
  
  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/mongodb/container/docker/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}

setup_mongodb_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi
  
  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/mongodb/container/docker/v1/template/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~root volumes~~~/~~~root volumes~~~\n  ${projectinit_database_service_name}_volume:/g" "${target_file}"
  
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mongodb/docker-entrypoint-initdb.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mongodb/docker-entrypoint-initdb.d"
  fi

  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/mongodb/container/docker/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}

setup_mongodb_dev_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/dev/mongodb/Dockerfile"
  
  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/dockerfile/dev" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
}

setup_mongodb_prod_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/mongodb/Dockerfile"

  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/dockerfile/prod" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
}

setup_mongodb_config_dev() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mongodb/etc" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mongodb/etc"
  fi
    
  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/config/dev.conf" "${project_root_dir}/projectinit_docker/dev/mongodb/etc/mongod.conf"
}

setup_mongodb_config_prod() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mongodb/etc" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mongodb/etc"
  fi

  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/config/prod.conf" "${project_root_dir}/projectinit_docker/prod/mongodb/etc/mongod.conf"
}

setup_mongodb_dev_entrypoint() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mongodb/usr/local/bin" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mongodb/usr/local/bin"
  fi

  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/entrypoint/dev.sh" "${project_root_dir}/projectinit_docker/dev/mongodb/usr/local/bin/entrypoint.sh"
}

setup_mongodb_prod_entrypoint() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mongodb/usr/local/bin" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mongodb/usr/local/bin"
  fi

  cp -f "${tool_dir}/src/database/mongodb/container/docker/v1/template/entrypoint/prod.sh" "${project_root_dir}/projectinit_docker/prod/mongodb/usr/local/bin/entrypoint.sh"
}