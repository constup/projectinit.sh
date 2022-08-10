#!/bin/bash

#######################################
# Check if NestJS is installed in the current version of NodeJS and install it if it's not.
# Arguments:
#  None
#######################################
check_and_install_nestjs() {
  if ! nestjs_version; then
    echo -e "NestJS is not installed in this version of NodeJS. Installing automatically..."
    npm i -g @nestjs/cli
  fi
}
