#!/bin/bash

build_dev() {
  echo ""
  echo "Building Dev container..."
  cd "${project_root_dir}" || exit 1
  docker compose -f compose_dev.yaml build
  echo "  Dev container built..."
}