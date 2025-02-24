#!/bin/bash

build_installer() {
  echo ""
  echo "Building Installer container..."
  cd "${project_root_dir}" || exit 1;
  docker compose up --build
  echo "  Installer container built..."
}

cleanup_installer() {
  echo ""
  echo "Cleaning up the installer..."
  echo "  Removing installer container..."
  docker rm "${projectinit_app_service_name}_installer"
  echo "  Removing installer service image..."
  docker rmi "projectinit/${projectinit_app_service_name}:installer"
  echo "  Installer container cleaned up..."
}