#!/bin/bash

setup_installer_templates() {
  # shellcheck source=../../../templates/docker_compose/installer_v1.yml
  PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_DOCKER_COMPOSE="${tool_dir}/src/docker/templates/docker_compose/installer_v1.yml"
  # shellcheck source=../../../templates/dockerfile/php/symfony/installer_v1
  PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_DOCKERFILE="${tool_dir}/src/docker/templates/dockerfile/php/symfony/installer_v1"
  # shellcheck source=../../../templates/startup_script/php/symfony/installer_v1.sh
  PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_STARTUP="${tool_dir}/src/docker/templates/startup_script/php/symfony/installer_v1.sh"
}

setup_project_templates() {
  # shellcheck source=../../../templates/docker_compose/v1.yml
  PROJECTINIT_DOCKER_TEMPLATE_DOCKER_COMPOSE="${tool_dir}/src/docker/templates/docker_compose/v1.yml"
  # shellcheck source=../../../templates/dockerfile/php/symfony/dev_v1
  PROJECTINIT_DOCKER_TEMPLATE_DOCKERFILE_DEV="${tool_dir}/src/docker/templates/dockerfile/php/symfony/dev_v1"
  # shellcheck source=../../../templates/startup_script/php/symfony/installer_v1.sh
  PROJECTINIT_DOCKER_TEMPLATE_STARTUP="${tool_dir}/src/docker/templates/startup_script/php/symfony/v1.sh"
  # shellcheck source=../../../templates/documentation/php/symfony/v1.adoc
  PROJECTINIT_DOCKER_TEMPLATE_README="${tool_dir}/src/docker/templates/documentation/php/symfony/v1.adoc"
    case $PROJECTINIT_DOCKER_DATABASE_TYPE in
      "postgresql" )
        # shellcheck source=../../../templates/docker_compose/database/postgres/v1.yml
        PROJECTINIT_DOCKER_TEMPLATE_DATABASE_DOCKER_COMPOSE="${tool_dir}/src/docker/templates/docker_compose/database/postgres/v1.yml"
        # shellcheck source=../../../templates/startup_script/php/symfony/database/v1.sh
        PROJECTINIT_DOCKER_TEMPLATE_DATABASE_STARTUP="${tool_dir}/src/docker/templates/startup_script/php/symfony/database/v1.sh"
        ;;
    esac
}