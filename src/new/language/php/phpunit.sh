#!/bin/bash

install_phpunit_bare_metal() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php composer.phar require --dev "${projectinit_phpunit_version}"
  else
    composer require --dev "${projectinit_phpunit_version}"
  fi
}