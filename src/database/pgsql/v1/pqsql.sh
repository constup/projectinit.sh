#!/bin/bash

setup_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"
  
  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/pgsql/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"

  projectinit_compose_has_secrets=1
  mkdir -p "${project_root_dir}/compose_secrets"
  touch "${project_root_dir}/compose_secrets/postgres_password.txt"
  echo "${projectinit_database_password}" >> "${project_root_dir}/compose_secrets/postgres_password.txt"
  touch "${project_root_dir}/compose_secrets/postgres_db.txt"
  echo "${projectinit_database_name}" >> "${project_root_dir}/compose_secrets/postgres_db.txt"
  touch "${project_root_dir}/compose_secrets/postgres_user.txt"
  echo "${projectinit_database_user}" >> "${project_root_dir}/compose_secrets/postgres_user.txt"

  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/pgsql/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}

setup_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/compose.yaml"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir "${project_root_dir}/projectinit_docker/prod"
  fi

  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/pgsql/v1/template/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"

  perl -pi -e "s/~~~compose secrets~~~/$(<"${tool_dir}/src/database/pgsql/v1/template/secrets" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
}