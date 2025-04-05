#!/bin/bash

setup_mariadb_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"
    
  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/mariadb/container/docker/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~x plugin host port~~~/${projectinit_database_x_plugin_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~root volumes~~~/~~~root volumes~~~\n  ${projectinit_database_service_name}_volume:/g" "${target_file}"

  mkdir -p "${project_root_dir}/compose_secrets"
  touch "${project_root_dir}/compose_secrets/mariadb_password.txt"
  echo "${projectinit_database_password}" >> "${project_root_dir}/compose_secrets/mariadb_password.txt"
  touch "${project_root_dir}/compose_secrets/mariadb_root_password.txt"
  echo "${projectinit_database_root_password}" >> "${project_root_dir}/compose_secrets/mariadb_root_password.txt"
  touch "${project_root_dir}/compose_secrets/mariadb_database.txt"
  echo "${projectinit_database_name}" >> "${project_root_dir}/compose_secrets/mariadb_database.txt"
  touch "${project_root_dir}/compose_secrets/mariadb_user.txt"
  echo "${projectinit_database_user}" >> "${project_root_dir}/compose_secrets/mariadb_user.txt"

  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mariadb/docker-entrypoint-initdb.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mariadb/docker-entrypoint-initdb.d"
  fi

  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/mariadb/container/docker/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}

setup_mariadb_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi
    
  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/mariadb/container/docker/v1/template/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~x plugin host port~~~/${projectinit_database_x_plugin_host_port}/g" "${target_file}"
  perl -pi -e "s/~~~root volumes~~~/~~~root volumes~~~\n  ${projectinit_database_service_name}_volume:/g" "${target_file}"

  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mariadb/docker-entrypoint-initdb.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mariadb/docker-entrypoint-initdb.d"
  fi

  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/mariadb/container/docker/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}

setup_mariadb_dev_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/dev/mariadb/Dockerfile"

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/dockerfile/dev" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
}

setup_mariadb_prod_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/mariadb/Dockerfile"

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/dockerfile/prod" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
}

setup_mariadb_my_cnf_dev() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mariadb/etc/mysql/conf.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mariadb/etc/mysql/conf.d"
  fi

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/my_cnf/dev_my.cnf" "${project_root_dir}/projectinit_docker/dev/mariadb/etc/mysql/conf.d/my.cnf"
  chmod 644 "${project_root_dir}/projectinit_docker/dev/mariadb/etc/mysql/conf.d/my.cnf"
}

setup_mariadb_my_cnf_prod() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mariadb/etc/mysql/conf.d" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mariadb/etc/mysql/conf.d"
  fi

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/my_cnf/prod_my.cnf" "${project_root_dir}/projectinit_docker/prod/mariadb/etc/mysql/conf.d/my.cnf"
  chmod 644 "${project_root_dir}/projectinit_docker/prod/mariadb/etc/mysql/conf.d/my.cnf"
}

setup_mariadb_dev_entrypoint() {
  if [ ! -d "${project_root_dir}/projectinit_docker/dev/mariadb" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/dev/mariadb"
  fi

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/entrypoint/dev.sh" "${project_root_dir}/projectinit_docker/dev/mariadb/entrypoint.sh"
}

setup_mariadb_prod_entrypoint() {
  if [ ! -d "${project_root_dir}/projectinit_docker/prod/mariadb" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod/mariadb"
  fi

  cp -f "${tool_dir}/src/database/mariadb/container/docker/v1/template/entrypoint/prod.sh" "${project_root_dir}/projectinit_docker/prod/mariadb/entrypoint.sh"
}