#!/bin/bash

install_php_cs_fixer_bare_metal() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php composer.phar require --dev friendsofphp/php-cs-fixer
  else
    composer require --dev friendsofphp/php-cs-fixer
  fi
}