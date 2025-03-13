#!/bin/bash

build_dev() {
  echo ""
  echo "Building Dev container..."
  cd "${project_root_dir}" || exit 1
  docker compose -f compose_dev.yaml --env-file .env.docker build --no-cache
  echo "  Dev container built..."
}