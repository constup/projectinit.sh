#!/bin/bash

download_latest_php_documentor () {
  echo ""
  cd "${PROJECT_ROOT_DIR}" || exit 1;
  wget https://phpdoc.org/phpDocumentor.phar
  chmod +x phpDocumentor.phar
  echo ""
  php phpDocumentor.phar --version
}
