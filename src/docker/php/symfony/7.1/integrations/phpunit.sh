#!/bin/bash

select_phpunit_version() {
  echo ""
  echo "PHPUnit version:"
  local selection=("Symfony Test Pack" "PHPUnit 9" "PHPUnit 10" "PHPUnit 11")
  select option in "${selection[@]}"; do
    case $option in
      "Symfony Test Pack" )
        PROJECTINIT_DOCKER_UNIT_TESTING_FRAMEWORK="symfony\/test-pack"
        break;;
      "PHPUnit 9" )
        PROJECTINIT_DOCKER_UNIT_TESTING_FRAMEWORK="phpunit\/phpunit:\^9"
        break;;
      "PHPUnit 10" )
        PROJECTINIT_DOCKER_UNIT_TESTING_FRAMEWORK="phpunit\/phpunit:\^10"
        break;;
      "PHPUnit 11" )
        PROJECTINIT_DOCKER_UNIT_TESTING_FRAMEWORK="phpunit\/phpunit:\^11"
        break;;
    esac
  done
}