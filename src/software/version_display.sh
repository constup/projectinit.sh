#!/bin/bash

#######################################
# Show version of curl.
# Arguments:
#  None
#######################################
curl_version () {
  echo ""
  echo "curl version:"
  curl --version
}

#######################################
# Show version of git
# Arguments:
#  None
#######################################
git_version () {
  echo ""
  echo "Git version:"
  git --version
}

#######################################
# Show version of NodeJS.
# Arguments:
#  None
#######################################
node_version () {
  echo ""
  echo "Node version:"
  node --version
}

#######################################
# Show version of npm (nodejs package manager)
# Arguments:
#  None
#######################################
npm_version () {
  echo ""
  echo "NPM version:"
  npm --version
}

#######################################
# Show version of nvm (nodejs version manager)
# Arguments:
#  None
#######################################
nvm_version () {
  echo ""
  echo "NVM version:"
  nvm version
}

#######################################
# Show version of NestJS
# Arguments:
#  None
#######################################
nestjs_version () {
  echo ""
  echo "NestJS version:"
  nest --version
}

#######################################
# Show version of PHP.
# Arguments:
#  None
#######################################
php_version () {
  echo ""
  echo "PHP version:"
  php -v
}

#######################################
# Show version of wget.
# Arguments:
#  None
#######################################
wget_version () {
  echo ""
  echo "wget version:"
  wget --version
}
