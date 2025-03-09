#!/bin/bash

setup_installer_compose() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/compose/v1/template/installer" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}_installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~image name~~~/projectinit\/${projectinit_app_service_name}:installer/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose.yaml"
}

setup_dev_compose() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/compose/v1/template/dev" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose_dev.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose_dev.yaml"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_docker_compose_dev

  if [ "${projectinit_use_memcached}" -eq 1 ]; then
    # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
    source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
    setup_memcached_docker_compose_dev
  fi

  perl -i -ne 'print unless /~~~compose secrets~~~/;' "${project_root_dir}/compose_dev.yaml"
  if [ "$projectinit_docker_service_dependencies" -eq 0 ]; then
    perl -i -ne 'print unless /depends_on:/;' "${project_root_dir}/compose_dev.yaml"
  fi
  if [ "$projectinit_compose_has_secrets" -eq 0 ]; then
    perl -i -ne 'print unless /secrets:/;' "${project_root_dir}/compose_dev.yaml"
  fi
  perl -i -ne 'print unless /~~~tools~~~/;' "${project_root_dir}/compose_dev.yaml"
}

setup_prod_compose() {
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/compose/v1/template/prod" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~service name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~container name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~image name~~~/${projectinit_app_service_name}/g" "${project_root_dir}/compose.yaml"
  perl -pi -e "s/~~~host port~~~/${projectinit_app_host_port}/g" "${project_root_dir}/compose.yaml"

  # shellcheck source=../../../../../../../database/database_flow.sh
  source "${tool_dir}/src/database/database_flow.sh"
  setup_database_docker_compose_prod

  if [ "${projectinit_use_memcached}" -eq 1 ]; then
    # shellcheck source=../../../../../../../tools/cache/memcached/v1/memcached.sh
    source "${tool_dir}/src/tools/cache/memcached/v1/memcached.sh"
    setup_memcached_docker_compose_prod
  fi

  perl -i -ne 'print unless /~~~compose secrets~~~/;' "${project_root_dir}/compose.yaml"
  if [ "$projectinit_docker_service_dependencies" -eq 0 ]; then
    perl -i -ne 'print unless /depends_on:/;' "${project_root_dir}/compose.yaml"
  fi
  if [ "$projectinit_compose_has_secrets" -eq 0 ]; then
    perl -i -ne 'print unless /secrets:/;' "${project_root_dir}/compose.yaml"
  fi
  perl -i -ne 'print unless /~~~tools~~~/;' "${project_root_dir}/compose.yaml"
}