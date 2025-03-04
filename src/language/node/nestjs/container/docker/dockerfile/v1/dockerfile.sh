#!/bin/bash

setup_installer_dockerfile() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/installer" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${project_root_dir}/Dockerfile"
}

setup_dev_dockerfile() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/dev" "${project_root_dir}/Dockerfile_dev"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile_dev"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${project_root_dir}/Dockerfile_dev"
  case "$projectinit_node_package_manager" in
    "npm" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~package manager~~~/npm/g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~install options~~~//g" "${project_root_dir}/Dockerfile_dev"
      ;;
    "yarn" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~package manager~~~/yarn/g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~install options~~~/ --frozen-lockfile --non-interactive/g" "${project_root_dir}/Dockerfile_dev"
      ;;
    "pnpm" )
      perl -pi -e "s/~~~install pnpm~~~/ pnpm/g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~package manager~~~/pnpm/g" "${project_root_dir}/Dockerfile_dev"
      perl -pi -e "s/~~~install options~~~/ --no-color --frozen-lockfile/g" "${project_root_dir}/Dockerfile_dev"
      ;;
  esac
}

setup_prod_dockerfile() {
  cp -f "${tool_dir}/src/language/node/nestjs/container/docker/dockerfile/v1/template/prod" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~language version~~~/${projectinit_language_version}/g" "${project_root_dir}/Dockerfile"
  perl -pi -e "s/~~~nestjs version~~~/${projectinit_nestjs_version}/g" "${project_root_dir}/Dockerfile"
  case "$projectinit_node_package_manager" in
    "npm" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~package manager~~~/npm/g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~install options~~~//g" "${project_root_dir}/Dockerfile"
      ;;
    "yarn" )
      perl -pi -e "s/~~~install pnpm~~~//g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~package manager~~~/yarn/g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~install options~~~/ --prod --frozen-lockfile --non-interactive/g" "${project_root_dir}/Dockerfile"
      ;;
    "pnpm" )
      perl -pi -e "s/~~~install pnpm~~~/ pnpm/g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~package manager~~~/pnpm/g" "${project_root_dir}/Dockerfile"
      perl -pi -e "s/~~~install options~~~/ --no-color --frozen-lockfile --prod/g" "${project_root_dir}/Dockerfile"
      ;;
  esac
}