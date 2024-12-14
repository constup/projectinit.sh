#!/bin/bash

build_installer() {
  echo ""
  echo "Building Docker container..."
  cd "${project_root_dir}" || exit 1;
  docker compose up --build
  echo "Container built..."
}

cleanup_installer() {
  echo ""
  echo "Cleaning up the installer..."
  echo "Removing installer container..."
  docker rm "$PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME"
  echo "Removing installer service image..."
  docker rmi projectinit/"$PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME":installer
  echo "Installer container cleaned up..."
}