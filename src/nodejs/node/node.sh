#!/bin/bash

#######################################
# Install the latest LTS version of NodeJS by using NVM.
# Arguments:
#  None
#######################################
install_node_lts_nvm() {
  echo "";
  echo "Using nvm to install NodeJS LTS...";
  nvm install --lts;
  node --version
}
