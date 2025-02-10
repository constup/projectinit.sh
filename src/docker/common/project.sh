#!/bin/bash

build_project() {
  echo ""
  echo "Building Docker container..."
  cd "${project_root_dir}" || exit 1;
  docker compose -f compose_dev.yaml build
  echo "Container built..."
}