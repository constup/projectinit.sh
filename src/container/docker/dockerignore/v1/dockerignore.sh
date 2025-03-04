#!/bin/bash

setup_dockerignore() {
  cp -f "${tool_dir}/src/container/docker/dockerignore/v1/template/v1" "${project_root_dir}/.dockerignore"
}