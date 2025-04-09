#!/bin/bash

run_symfony_flow_bare_metal() {
  # shellcheck source=./symfony.sh
  source "${tool_dir}/src/language/php/symfony/symfony.sh"
  create_symfony_project "$projectinit_symfony_version" "$projectinit_symfony_app_type" "composer"
}

run_symfony_flow_docker() {
  # shellcheck source=../../../container/docker/dockerignore/v1/dockerignore.sh
  source "${tool_dir}/src/container/docker/dockerignore/v1/dockerignore.sh"
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/compose/v1/compose.sh"
  # shellcheck source=../../../container/docker/dot_env_docker/docker_dot_env.sh
  source "${tool_dir}/src/container/docker/dot_env_docker/docker_dot_env.sh"
  # shellcheck source=../../../projectinit_subsystem/integrations/integrations.sh
  source "${tool_dir}/src/projectinit_subsystem/integrations/integrations.sh"

  init_integrations

  echo "Setting up installer container..."
  setup_installer_dockerfile
  setup_installer_entrypoint
  setup_installer_compose
  add_user_and_group_ids
  run_service_integrations "installer"
  run_library_integrations "installer"
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
  run_service_integrations "dev"
  run_library_integrations "dev"
  echo "  Dev container set up..."

  # shellcheck source=../../../filesystem/directory_management.sh
  source "${tool_dir}/src/filesystem/directory_management.sh"
  create_php_project_base_directories
  # shellcheck source=./container/docker/configuration/dot_env.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/configuration/dot_env.sh"
  add_database_connection_to_env_dev
  # shellcheck source=./container/docker/doc/documentation.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/doc/documentation.sh"
  setup_symfony_documentation
  # shellcheck source=../../../container/docker/dev.sh
  source "${tool_dir}/src/container/docker/dev.sh"
  # shellcheck source=../tools/php_ini/v1/php_ini.sh
  source "${tool_dir}/src/language/php/tools/php_ini/v1/php_ini.sh"
  configure_php_ini_docker_dev
  # shellcheck source=../../../container/docker/docker.sh
  source "${tool_dir}/src/container/docker/docker.sh"
  cleanup_docker_compose "${project_root_dir}/compose.yaml"
  build_dev

  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/git/git.sh"
  configure_gitignore
  setup_prod_dockerfile
  setup_prod_entrypoint
  setup_prod_compose
  run_service_integrations "prod"
  run_library_integrations "prod"
  cleanup_docker_compose "${project_root_dir}/projectinit_docker/prod/compose.yaml"
  configure_php_ini_docker_prod
}