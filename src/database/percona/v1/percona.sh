#!/bin/bash

setup_docker_compose_dev() {
  local target_file
  target_file="${project_root_dir}/compose_dev.yaml"

  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/percona/v1/template/dev" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database name~~~/${projectinit_database_name}/g" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
  perl -pi -e "s/~~~database user name~~~/${projectinit_database_user}/g" "${target_file}"
  perl -pi -e "s/~~~database password~~~/${projectinit_database_password}/g" "${target_file}"
  perl -pi -e "s/~~~database root password~~~/${projectinit_database_root_password}/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
}

setup_docker_compose_prod() {
  local target_file
  target_file="${project_root_dir}/compose.yaml"

  perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/database/percona/v1/template/prod" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${target_file}"
  perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${target_file}"
  perl -pi -e "s/~~~database name~~~/${projectinit_database_name}/g" "${target_file}"
  perl -pi -e "s/~~~database server version~~~/${projectinit_database_version}/g" "${target_file}"
  perl -pi -e "s/~~~database user name~~~/<<<YOUR DATABASE USERNAME OR SECRET GOES HERE>>>/g" "${target_file}"
  perl -pi -e "s/~~~database password~~~/<<<YOUR DATABASE USER PASSWORD OR SECRET GOES HERE>>>/g" "${target_file}"
  perl -pi -e "s/~~~database root password~~~/<<<YOUR DATABASE ROOT PASSWORD OR SECRET GOES HERE>>>/g" "${target_file}"
  perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${target_file}"
}