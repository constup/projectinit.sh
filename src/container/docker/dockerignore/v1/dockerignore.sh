#!/bin/bash

setup_dockerignore() {
  cp -f "${tool_dir}/src/container/docker/dockerignore/v1/template/.dockerignore" "${project_root_dir}/.dockerignore"
}