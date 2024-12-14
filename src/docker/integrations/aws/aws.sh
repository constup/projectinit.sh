#!/bin/bash

#######################################
# Configure AWS services in Docker containers
# Globals:
#   project_root_dir - root directory of your project
# Arguments:
#  None
#######################################
use_aws_or_not() {
  echo ""
  cd "${project_root_dir}" || exit 1
  echo "Are you going to use AWS services in your project?"
  local use_aws_services=("Yes" "No")
  local uas
  select uas in "${use_aws_services[@]}"; do
    case $uas in
      "Yes" )
        perl -pi -e 's/# ARG AWS_CONTAINER_CREDENTIALS_RELATIVE_URI/ARG AWS_CONTAINER_CREDENTIALS_RELATIVE_URI/g' ../Dockerfile_local
        break;;
      "No" )
        break;;
    esac
  done
}
