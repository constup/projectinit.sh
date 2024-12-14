#!/bin/bash

build_project() {
  echo ""
  echo "Building Docker container..."
  cd "${project_root_dir}" || exit 1;
  docker compose up --build
  echo "Container built..."
}