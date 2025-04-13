#!/bin/bash

install_phpunit_bare_metal() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php composer.phar require --dev "${projectinit_phpunit_version}"
  else
    composer require --dev "${projectinit_phpunit_version}"
  fi
}

configure_phpunit() {
  echo "    Configuring phpunit.xml..."
  if [ "$projectinit_use_projectinit_phpunit_dist" -eq 1 ]; then
    echo "      ProjectInit PHPUnit configuration is used..."
    case $projectinit_phpunit_version in
      "phpunit/phpunit:^9" )
        cp -f "${tool_dir}/src/libraries/testing_internal/php/php_unit/template/v9.xml.dist" "${project_root_dir}/phpunit.xml"
        ;;
      "phpunit/phpunit:^10" )
        cp -f "${tool_dir}/src/libraries/testing_internal/php/php_unit/template/v10.xml.dist" "${project_root_dir}/phpunit.xml"
        ;;
      "phpunit/phpunit:^11" )
        cp -f "${tool_dir}/src/libraries/testing_internal/php/php_unit/template/v11.xml.dist" "${project_root_dir}/phpunit.xml"
        ;;
      "phpunit/phpunit:^12" )
        cp -f "${tool_dir}/src/libraries/testing_internal/php/php_unit/template/v12.xml.dist" "${project_root_dir}/phpunit.xml"
        ;;
    esac
  else
    echo "      Default phpunit configuration is used..."
  fi
  echo "      phpunit.xml configured"
}

setup_phpunit_entrypoint_installer() {
  local target_file
  target_file="${project_root_dir}/start.sh"

  local phpunit_string
  phpunit_string=$(perl -e 'print quotemeta($ARGV[0])' "$projectinit_phpunit_version")
  perl -pi -e "s/(.*~~~install composer library~~.*)/composer require --dev --no-cache ${phpunit_string}\n  \1/g" "${target_file}"
}

run_phpunit_integration_dev() {
  configure_phpunit
}
run_phpunit_integration_installer() {
  setup_phpunit_entrypoint_installer
}