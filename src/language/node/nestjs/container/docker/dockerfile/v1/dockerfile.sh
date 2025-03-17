#!/bin/bash

setup_installer_dockerfile() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/installer" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${target_file}"
}

setup_dev_dockerfile() {
  local target_file
  target_file="${project_root_dir}/Dockerfile"

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/dev" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${target_file}"
  case "$projectinit_node_package_manager" in
    "npm" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/npm/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~//g" "${target_file}"
      ;;
    "yarn" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/yarn/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~/ --frozen-lockfile --non-interactive/g" "${target_file}"
      ;;
    "pnpm" )
      perl -pi -e "s/~~~install pnpm~~~/ pnpm/g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/pnpm/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~/ --no-color --frozen-lockfile/g" "${target_file}"
      ;;
  esac
}

setup_prod_dockerfile() {
  local target_file
  target_file="${project_root_dir}/projectinit_docker/prod/Dockerfile"
  if [ ! -d "${project_root_dir}/projectinit_docker/prod" ]; then
    mkdir -p "${project_root_dir}/projectinit_docker/prod"
  fi

  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/prod" "${target_file}"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${target_file}"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${target_file}"
  case "$projectinit_node_package_manager" in
    "npm" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/npm/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~//g" "${target_file}"
      ;;
    "yarn" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/yarn/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~/ --prod --frozen-lockfile --non-interactive/g" "${target_file}"
      ;;
    "pnpm" )
      perl -pi -e "s/~~~install pnpm~~~/ pnpm/g" "${target_file}"
      perl -pi -e "s/~~~package manager~~~/pnpm/g" "${target_file}"
      perl -pi -e "s/~~~install options~~~/ --no-color --frozen-lockfile --prod/g" "${target_file}"
      ;;
  esac
}