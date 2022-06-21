#!/bin/bash

install_node_lts_nvm() {
  echo "";
  echo "Using nvm to install NodeJS LTS...";
  nvm install --lts;
  node --version
}
