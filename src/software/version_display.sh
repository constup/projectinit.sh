#!/bin/bash

curl_version () {
  echo ""
  echo "curl version:"
  curl --version
}

git_version () {
  echo ""
  echo "Git version:"
  git --version
}

node_version () {
  echo ""
  echo "Node version:"
  node --version
}

npm_version () {
  echo ""
  echo "NPM version:"
  npm --version
}

php_version () {
  echo ""
  echo "PHP version:"
  php -v
}

wget_version () {
  echo ""
  echo "wget version:"
  wget --version
}
