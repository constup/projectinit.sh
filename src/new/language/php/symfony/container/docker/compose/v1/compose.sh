#!/bin/bash

setup_installer_compose() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/compose/v1/template/installer" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~image name~~~/projectinit\/${projectinit_app_service_name}:installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose.yaml"
}

setup_dev_compose() {
  cp -f "${tool_dir}/src/new/language/php/symfony/container/docker/compose/v1/template/dev" "${project_root_dir}/compose-local.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose-local.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose-local.yaml"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose-local.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose-local.yaml"
  case "$projectinit_database_type" in
    "no database" )
      perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose-local.yaml"
      ;;
    "pgsql" )
      perl -pi -e "s/~~~database service~~~/$(<"${tool_dir}/src/new/language/php/symfony/container/docker/compose/v1/template/pgsql" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/compose-local.yaml"
      ;;
  esac
  if [ ! "${projectinit_database_type}" = "no database" ]; then
    perl -pi -e "s/~~~database service name~~~/${projectinit_database_service_name}/g" "${project_root_dir}/compose-local.yaml"
    perl -pi -e "s/~~~database container name~~~/${projectinit_database_service_name}/g" "${project_root_dir}/compose-local.yaml"
    perl -pi -e "s/~~~database user name~~~/${projectinit_database_user}/g" "${project_root_dir}/compose-local.yaml"
    perl -pi -e "s/~~~database password~~~/${projectinit_database_password}/g" "${project_root_dir}/compose-local.yaml"
    perl -pi -e "s/~~~database host port~~~/${projectinit_database_host_port}/g" "${project_root_dir}/compose-local.yaml"
  fi
}