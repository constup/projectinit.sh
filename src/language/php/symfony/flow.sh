#!/bin/bash

run_symfony_flow_bare_metal() {
  # shellcheck source=./symfony.sh
  source "${tool_dir}/src/language/php/symfony/symfony.sh"
  create_symfony_project "$projectinit_symfony_version" "$projectinit_symfony_app_type" "composer"
}

run_symfony_flow_docker() {
  # shellcheck source=../../../container/docker/dockerignore/v1/dockerignore.sh
  source "${tool_dir}/src/container/docker/dockerignore/v1/dockerignore.sh"
  # shellcheck source=../../../container/docker/docker.sh
  source "${tool_dir}/src/container/docker/docker.sh"
  calculate_app_service_dependencies
  # shellcheck source=./container/docker/dockerfile/v1/dockerfile.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/dockerfile/v1/dockerfile.sh"
  # shellcheck source=./container/docker/entrypoint/v1/entrypoint.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/entrypoint/v1/entrypoint.sh"
  # shellcheck source=./container/docker/compose/v1/compose.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/compose/v1/compose.sh"
  echo "Setting up installer container..."
  setup_installer_dockerfile
  setup_installer_entrypoint
  setup_installer_compose
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

  # shellcheck source=../../../filesystem/directory_management.sh
  source "${tool_dir}/src/filesystem/directory_management.sh"
  create_php_project_base_directories
  # shellcheck source=../../../git/git.sh
  source "${tool_dir}/src/git/git.sh"
  configure_gitignore
  # shellcheck source=../tools/unit_testing/phpunit.sh
  source "${tool_dir}/src/language/php/tools/unit_testing/phpunit.sh"
  configure_phpunit
  # shellcheck source=../tools/style_fixer/php_cs_fixer.sh
  source "${tool_dir}/src/language/php/tools/style_fixer/php_cs_fixer.sh"
  configure_php_cs_fixer
  # shellcheck source=./container/docker/configuration/dot_env.sh
  source "${tool_dir}/src/language/php/symfony/container/docker/configuration/dot_env.sh"
  add_database_connection_to_env_dev
  cp -f "${tool_dir}/src/language/php/symfony/container/docker/doc/PROJECTINIT_README_v1.adoc" "${project_root_dir}/PROJECTINIT_README.adoc"
  # shellcheck source=../../../container/docker/dev.sh
  source "${tool_dir}/src/container/docker/dev.sh"
  build_dev

  setup_prod_dockerfile
  setup_prod_entrypoint
  setup_prod_compose
}