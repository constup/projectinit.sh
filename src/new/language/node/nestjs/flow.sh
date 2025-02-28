#!/bin/bash

run_nestjs_flow_docker() {
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/dockerfile/v1/dockerfile.sh"
    # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/compose/v1/compose.sh"
  echo "Setting up installer container..."
  setup_installer_dockerfile
  setup_installer_entrypoint
  setup_installer_compose
  echo "  Installer container set up..."

  # shellcheck source=../../../container/docker/installer.sh
  source "${tool_dir}/src/new/container/docker/installer.sh"
  build_installer
  cleanup_installer
  remove_installer_files

  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/new/git/git.sh"
  configure_gitignore
}