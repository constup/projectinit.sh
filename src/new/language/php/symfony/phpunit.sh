#!/bin/bash

ask_phpunit_version() {
  echo ""
  echo "PHPUnit version. Note: the latest minor version will be used"
  local options=("8" "9" "10" "11" "12" "Symfony Test Pack" "Custom")
  local option
  select option in "${options[@]}"; do
    case $option in
      "8" )
        echo ""
        echo "PHPUnit 8 will be used"
        echo "  Release date: February 2019."
        echo "  End of bugfix support: February 2023."
        echo "  Requires PHP 7.2 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^8"
        break;;
      "9" )
        echo ""
        echo "PHPUnit 9 will be used"
        echo "  Release date: February 2020."
        echo "  End of bugfix support: February 2024."
        echo "  Requires PHP 7.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^9"
        break;;
      "10" )
        echo ""
        echo "PHPUnit 10 will be used"
        echo "  Release date: February 2023."
        echo "  End of bugfix support: February 2025."
        echo "  Requires PHP 8.1 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^10"
        break;;
      "11" )
        echo ""
        echo "PHPUnit 11 will be used"
        echo "  Release date: February 2024."
        echo "  End of bugfix support: February 2026."
        echo "  Requires PHP 8.2 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^11"
        break;;
      "12")
        echo ""
        echo "PHPUnit 12 will be used"
        echo "  Release date: February 2025."
        echo "  End of bug fix support: February 2027."
        echo "  Requires PHP 8.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^12"
        break;;
      "Symfony Test Pack" )
        echo ""
        echo "Symfony Test Pack bundle will be used to install PHPUnit."
        echo "  Symfony determines which version will be installed."
        echo "  Symfony may or may not install the latest version of PHPUnit."
        echo "  Check composer.json after creating the project to see which version of PHPUnit is used."
        echo ""
        projectinit_phpunit_version="symfony/test-pack"
        break;;
    esac
  done

  echo "Are you sure?"
  local confirmation_options=("yes" "no")
  local confirmation_option
  select confirmation_option in "${confirmation_options[@]}"; do
    case $confirmation_option in
      "yes" )
        break;;
      "no" )
        ask_phpunit_version
        break;;
    esac
  done
}