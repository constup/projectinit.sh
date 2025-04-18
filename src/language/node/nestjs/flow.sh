#!/bin/bash

run_nestjs_flow_docker() {
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/language/node/nestjs/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/language/node/nestjs/container/docker/compose/v1/compose.sh"
  # shellcheck source=../../../container/docker/dockerignore/v1/dockerignore.sh
  source "${tool_dir}/src/container/docker/dockerignore/v1/dockerignore.sh"
  echo "Setting up installer container..."
  setup_installer_dockerfile
  setup_installer_entrypoint
  setup_installer_compose
  # shellcheck source=../../../container/docker/dot_env_docker/docker_dot_env.sh
  source "${tool_dir}/src/container/docker/dot_env_docker/docker_dot_env.sh"
  add_user_and_group_ids
  echo "  Installer container set up..."

  # shellcheck source=../../../container/docker/installer.sh
  source "${tool_dir}/src/container/docker/installer.sh"
  build_installer
  cleanup_installer
  remove_installer_files

  echo "Setting up dev container..."
  setup_dockerignore
  setup_dev_dockerfile
  setup_dev_entrypoint
  setup_dev_compose
  echo "  Dev container set up..."

  # shellcheck source=../../../container/docker/dev.sh
  source "${tool_dir}/src/container/docker/dev.sh"
  build_dev

  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/git/git.sh"
  configure_gitignore
  setup_prod_dockerfile
  setup_prod_entrypoint
  setup_prod_compose
  # shellcheck source=./container/docker/doc/documentation.sh
  source "${tool_dir}/src/language/node/nestjs/container/docker/doc/documentation.sh"
  setup_nestjs_documentation
}