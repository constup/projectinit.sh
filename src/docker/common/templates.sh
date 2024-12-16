#!/bin/bash

copy_installer_templates() {
  echo ""
  echo "Copying installer templates..."
  echo "docker compose..."
  cp "${PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_DOCKER_COMPOSE}" "${project_root_dir}/compose.yaml"
  echo "dockerfile..."
  cp "${PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_DOCKERFILE}" "${project_root_dir}/Dockerfile"
  echo "startup script..."
  cp "${PROJECTINIT_DOCKER_INSTALLER_TEMPLATE_STARTUP}" "${project_root_dir}/start.sh"
  echo "Installer templates are copied..."
}

cleanup_installer_templates() {
  echo ""
  echo "Cleaning up installer templates..."
  rm "${project_root_dir}/compose.yaml" "${project_root_dir}/Dockerfile" "${project_root_dir}/start.sh"
  echo "Installer templates are removed..."
}

copy_project_templates() {
  echo ""
  echo "Copying project templates..."
  echo "docker compose..."
  cp -f "${PROJECTINIT_DOCKER_TEMPLATE_DOCKER_COMPOSE}" "${project_root_dir}/compose.yaml"
  echo "dockerfile..."
  cp -f "${PROJECTINIT_DOCKER_TEMPLATE_DOCKERFILE_DEV}" "${project_root_dir}/Dockerfile_dev"
  echo "startup script..."
  cp -f "${PROJECTINIT_DOCKER_TEMPLATE_STARTUP}" "${project_root_dir}/start.sh"
  echo "readme..."
  cp -f "${PROJECTINIT_DOCKER_TEMPLATE_README}" "${project_root_dir}/PROJECTINIT_README.adoc"
  echo "Project templates are copied..."
}

inject_installer_properties() {
  echo ""
  echo "Populating installer service properties..."
  echo "language version..."
  perl -pi -e "s/~~~language version~~~/${PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION}/g" "${project_root_dir}/Dockerfile"
  echo "docker service name..."
  perl -pi -e "s/~~~service name~~~/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}/g" "${project_root_dir}"/compose.yaml
  echo "container name..."
  perl -pi -e "s/~~~container name~~~/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}/g" "${project_root_dir}"/compose.yaml
  echo "host port..."
  perl -pi -e "s/~~~host port~~~/${PROJECTINIT_DOCKER_APP_HOST_PORT}/g" "${project_root_dir}"/compose.yaml
  echo "symfony version..."
  perl -pi -e "s/~~~symfony version~~~/${PROJECTINIT_DOCKER_INPUT_SYMFONY_VERSION}/g" "${project_root_dir}"/start.sh
  echo "docker image name..."
  perl -pi -e "s/~~~image name~~~/projectinit\/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}:installer/g" "${project_root_dir}"/compose.yaml
  echo "unit testing..."
  perl -pi -e "s/~~~unit testing~~~/ ${PROJECTINIT_DOCKER_PHPUNIT}/g" "${project_root_dir}"/start.sh
  if [ -n "$PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME" ]; then
    echo "orm..."
    perl -pi -e "s/#composer require symfony\/orm-pack/composer require symfony\/orm-pack/g" "${project_root_dir}/start.sh"
  fi
  if [ "$PROJECTINIT_DOCKER_SYMFONY_APP_TYPE" = "full" ]; then
    echo "symfony project type..."
    perl -pi -e "s/~~~web app~~~/--webapp/g" "${project_root_dir}"/start.sh
  else
    echo "symfony project type..."
    perl -pi -e "s/~~~web app~~~//g" "${project_root_dir}"/start.sh
  fi
  echo "Installer service properties are populated..."
}

inject_project_service_properties() {
  echo ""
  echo "Injecting project service properties..."
  echo "docker service name..."
  perl -pi -e "s/~~~service name~~~/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}/g" "${project_root_dir}"/compose.yaml
  echo "container name..."
  perl -pi -e "s/~~~container name~~~/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}/g" "${project_root_dir}"/compose.yaml
  echo "host port..."
  perl -pi -e "s/~~~host port~~~/${PROJECTINIT_DOCKER_APP_HOST_PORT}/g" "${project_root_dir}"/compose.yaml
  echo "symfony version..."
  perl -pi -e "s/~~~symfony version~~~/${PROJECTINIT_DOCKER_INPUT_SYMFONY_VERSION}/g" "${project_root_dir}"/start.sh
  echo "docker image name..."
  perl -pi -e "s/~~~image name~~~/${PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME}/g" "${project_root_dir}"/compose.yaml
  echo "language version..."
  perl -pi -e "s/~~~language version~~~/${PROJECTINIT_DOCKER_PROJECT_LANGUAGE_VERSION}/g" "${project_root_dir}/Dockerfile_dev"
  echo "Project service properties are injected..."
}

calculate_dependencies() {
  PROJECTINIT_DOCKER_SERVICE_DEPENDENCIES=0;
  if [ -n "$PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME" ]; then
    PROJECTINIT_DOCKER_SERVICE_DEPENDENCIES=$((PROJECTINIT_DOCKER_SERVICE_DEPENDENCIES + 1))
  fi
}

cleanup_project_templates() {
  echo ""
  echo "Cleaning up project templates..."
  echo "database engines..."
  perl -i -ne 'print unless /#pdo_mysql/;' "${project_root_dir}/Dockerfile_dev"
  perl -i -ne 'print unless /#pdo_pgsql/;' "${project_root_dir}/Dockerfile_dev"
  if [ "$PROJECTINIT_DOCKER_SERVICE_DEPENDENCIES" -eq 0 ]; then
    echo "container dependencies..."
    perl -i -ne 'print unless /depends_on:/;' "${project_root_dir}/compose.yaml"
  fi
  if [ -z "$PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME" ]; then
    echo "database service in compose.yaml"
    perl -i -ne 'print unless /~~~database service~~~/;' "${project_root_dir}/compose.yaml"
    echo "database initialization in startup script..."
    perl -i -ne 'print unless /~~~database creation and migration~~~/;' "${project_root_dir}/start.sh"
  fi
}