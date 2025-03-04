#!/bin/bash

run_nestjs_flow_docker() {
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/new/language/node/nestjs/container/docker/compose/v1/compose.sh"
  # shellcheck source=../../../container/docker/dockerignore/v1/dockerignore.sh
  source "${tool_dir}/src/new/container/docker/dockerignore/v1/dockerignore.sh"
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

  echo "Setting up dev container..."
  setup_dockerignore
  setup_dev_dockerfile
  setup_dev_entrypoint
  setup_dev_compose
  echo "  Dev container set up..."

  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/new/git/git.sh"
  configure_gitignore

  # shellcheck source=../../../container/docker/dev.sh
  source "${tool_dir}/src/new/container/docker/dev.sh"
  build_dev

  setup_prod_dockerfile
  setup_prod_entrypoint
  setup_prod_compose
  cp -f "${tool_dir}/src/new/language/node/nestjs/container/docker/doc/PROJECTINIT_README_v1.adoc" "${project_root_dir}/PROJECTINIT_README.adoc"
}