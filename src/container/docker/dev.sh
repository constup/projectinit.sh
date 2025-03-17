#!/bin/bash

build_dev() {
  echo ""
  echo "Building Dev container..."
  cd "${project_root_dir}" || exit 1
  docker compose --env-file .env.docker build
  echo "  Dev container built..."
}