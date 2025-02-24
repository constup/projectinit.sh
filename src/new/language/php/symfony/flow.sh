#!/bin/bash

run_symfony_flow_bare_metal() {
  # shellcheck source=./symfony.sh
  source "${tool_dir}/src/new/language/php/symfony/symfony.sh"
  create_symfony_project "$projectinit_symfony_version" "$projectinit_symfony_app_type" "composer"
}

run_symfony_flow_docker() {
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/new/language/php/symfony/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/new/language/php/symfony/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/new/language/php/symfony/container/docker/compose/v1/compose.sh"
  echo "Setting up installer container..."
  setup_installer_dockerfile
  setup_installer_entrypoint
  setup_installer_compose

  # shellcheck source=./container/docker/installer.sh
  source "${tool_dir}/src/new/language/php/symfony/container/docker/installer.sh"
  build_installer
  cleanup_installer
}