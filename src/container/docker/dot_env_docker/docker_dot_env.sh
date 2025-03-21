#!/bin/bash

add_user_and_group_ids() {
  if [ ! -f "${project_root_dir}/.env.docker" ]; then
    touch "${project_root_dir}/.env.docker"
  fi
  local user_id
  local group_id
  user_id=$(id -u)
  group_id=$(id -g)
  echo "PROJECTINIT_UID=${user_id}" >> "${project_root_dir}/.env.docker"
  echo "PROJECTINIT_GID=${group_id}" >> "${project_root_dir}/.env.docker"
}