#!/bin/bash

ask_phpunit_config() {
  echo ""
  echo "Do you want to use default PHPUnit configuration (if there is any) or ProjectInit's PHPUnit configuration?"
  local options=("Use default phpunit.dist.xml" "Use ProjectInit's phpunit.dist.xml")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Use default phpunit.dist.xml" )
        projectinit_use_projectinit_phpunit_dist=0
        break;;
      "Use ProjectInit's phpunit.dist.xml" )
        projectinit_use_projectinit_phpunit_dist=1
        break;;
    esac
  done
}

install_phpunit_bare_metal() {
  if [ "${projectinit_use_global_composer}" -eq 0 ]; then
    php composer.phar require --dev "${projectinit_phpunit_version}"
  else
    composer require --dev "${projectinit_phpunit_version}"
  fi
}

configure_phpunit() {
  echo ""
  echo "Configuring phpunit.dist.xml..."
  if [ "$projectinit_use_projectinit_phpunit_dist" -eq 1 ]; then
    case $projectinit_phpunit_version in
      "phpunit/phpunit:^9" )
        cp -f "${tool_dir}/src/language/php/tools/unit_testing/phpunit/v9.xml.dist" "${project_root_dir}/phpunit.dist.xml"
        ;;
      "phpunit/phpunit:^10" )
        cp -f "${tool_dir}/src/language/php/tools/unit_testing/phpunit/v10.xml.dist" "${project_root_dir}/phpunit.dist.xml"
        ;;
      "phpunit/phpunit:^11" )
        cp -f "${tool_dir}/src/language/php/tools/unit_testing/phpunit/v11.xml.dist" "${project_root_dir}/phpunit.dist.xml"
        ;;
      "phpunit/phpunit:^12" )
        cp -f "${tool_dir}/src/language/php/tools/unit_testing/phpunit/v12.xml.dist" "${project_root_dir}/phpunit.dist.xml"
        ;;
    esac
  fi
  echo "  phpunit.dist.xml configured"
}