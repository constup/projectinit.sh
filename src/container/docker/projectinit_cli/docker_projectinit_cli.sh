#!/bin/bash

setup_docker_projectinit_cli() {
  if [ ! -d "${project_root_dir}/projectinit_docker/cli/docker" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/cli/docker"
  fi

  cp -f "${tool_dir}/src/container/docker/projectinit_cli/template/docker_cli.sh" "${project_root_dir}/projectinit_docker/cli/docker/"
  perl -pi -e "s/~~~include file~~~/source .\/projectinit_docker\/cli\/docker\/docker_cli.sh\n~~~include file~~~/g" \
    "${project_root_dir}/projectinit_cli.sh"

  setup_docker_projectinit_cli_help
}

setup_docker_projectinit_cli_help() {
  local help_for_feature

  help_for_feature="  echo \"docker_compose_up - Start containers using Docker Compose\""
  perl -pi -e "s/~~~help for feature~~~/${help_for_feature}\n~~~help for feature~~~/g" "${project_root_dir}/projectinit_cli.sh"
}