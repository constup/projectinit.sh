#!/bin/bash

download_latest_php_documentor () {
  echo ""
  wget https://phpdoc.org/phpDocumentor.phar
  chmod +x phpDocumentor.phar
  echo ""
  php phpDocumentor.phar --version
}
