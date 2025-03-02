#!/bin/bash

setup_dev_dockerignore() {
  cp -f "${tool_dir}/src/new/language/node/nestjs/container/docker/dockerignore/v1/template/dev" "${project_root_dir}/.dockerignore"
}