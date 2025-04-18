#!/bin/bash

run_composer_package_flow_bare_metal() {
  # shellcheck source=../tools/composer.sh
  source "${tool_dir}/src/language/php/tools/composer.sh"
  check_if_composer_is_initialized
  if [ "$projectinit_is_composer_initialized" -eq 0 ]; then
    composer_init
  fi
}

run_composer_package_flow_docker() {
  # shellcheck source=../../../container/docker/dockerignore/v1/dockerignore.sh
  source "${tool_dir}/src/container/docker/dockerignore/v1/dockerignore.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/language/php/composer_package/container/docker/compose/v1/compose.sh"
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/language/php/composer_package/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/language/php/composer_package/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/configuration/index/v1/index.sh
  source "${tool_dir}/src/language/php/composer_package/container/docker/configuration/index/v1/index.sh"
  # shellcheck source=../../../container/docker/dev.sh
  source "${tool_dir}/src/container/docker/dev.sh"
  # shellcheck source=../../../projectinit_subsystem/integrations/integrations.sh
  source "${tool_dir}/src/projectinit_subsystem/integrations/integrations.sh"

  # shellcheck source=../../../filesystem/directory_management.sh
  source "${tool_dir}/src/filesystem/directory_management.sh"
  create_php_project_base_directories
  # shellcheck source=../../../container/docker/dot_env_docker/docker_dot_env.sh
  source "${tool_dir}/src/container/docker/dot_env_docker/docker_dot_env.sh"
  add_user_and_group_ids

  setup_dockerignore
  setup_dev_compose
  setup_dev_dockerfile
  setup_dev_entrypoint
  setup_dev_index
  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/git/git.sh"
  configure_gitignore
  # shellcheck source=./container/docker/doc/documentation.sh
  source "${tool_dir}/src/language/php/composer_package/container/docker/doc/documentation.sh"
  setup_composer_documentation
  # shellcheck source=../tools/php_ini/v1/php_ini.sh
  source "${tool_dir}/src/language/php/tools/php_ini/v1/php_ini.sh"
  configure_php_ini_docker_dev

  run_library_integrations "installer"
  run_library_integrations "dev"
  cleanup_dev_entrypoint
  build_dev
}