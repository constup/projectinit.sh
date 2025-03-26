#!/bin/bash

build_dev() {
  echo ""
  echo "Performing configuration cleanup..."
  cleanup_before_build
  echo "Configuration ready..."
  echo ""
  echo "Building Dev container..."
  cd "${project_root_dir}" || exit 1
  docker compose --env-file .env.docker build
  echo "  Dev container built..."
}

cleanup_before_build() {
  if [ "${projectinit_compose_has_root_volumes}" = 1 ]; then
    perl -pi -e "s/~~~root volumes~~~/volumes:/g" "${project_root_dir}/compose.yaml"
  else
    perl -pi -e "s/~~~root volumes~~~//g" "${project_root_dir}/compose.yaml"
  fi
}