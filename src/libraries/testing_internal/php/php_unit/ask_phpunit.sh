#!/bin/bash

ask_phpunit() {
  case $projectinit_project_type in
    "composer" )
      ask_phpunit_composer
      break;;
    "symfony" )
      ask_phpunit_symfony
      break;;
  esac

  ask_phpunit_config
}

ask_phpunit_composer() {
  echo ""
  echo "PHPUnit version. Note: the latest minor version will be used"
  local options=("PHPUnit 12" "PHPUnit 11" "PHPUnit 10" "PHPUnit 9")
  local option
  select option in "${options[@]}"; do
    case $option in
      "PHPUnit 12")
        echo ""
        echo "PHPUnit 12 will be used"
        echo "  Release date: February 2025."
        echo "  End of bug fix support: February 2027."
        echo "  Requires PHP 8.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^12"
        break;;
      "PHPUnit 11" )
        echo ""
        echo "PHPUnit 11 will be used"
        echo "  Release date: February 2024."
        echo "  End of bugfix support: February 2026."
        echo "  Requires PHP 8.2 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^11"
        break;;
      "PHPUnit 10" )
        echo ""
        echo "PHPUnit 10 will be used"
        echo "  Release date: February 2023."
        echo "  End of bugfix support: February 2025."
        echo "  Requires PHP 8.1 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^10"
        break;;
      "PHPUnit 9" )
        echo ""
        echo "PHPUnit 9 will be used"
        echo "  Release date: February 2020."
        echo "  End of bugfix support: February 2024."
        echo "  Requires PHP 7.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^9"
        break;;
    esac
  done

  local confirmation_options
  while true; do
    read -r -p "Are you sure (y/n)?" confirmation_options
    case "${confirmation_options,,}" in
      "y"|"yes"|"yup"|"yeah"|"1" ) break;;
      "n"|"no"|"nope"|"2" ) ask_phpunit_composer; break;;
      * ) echo "Invalid input. Asking again..."
    esac
  done
}

ask_phpunit_symfony() {
  echo ""
  echo "PHPUnit version. Note: the latest minor version will be used"
  local options=("Symfony Test Pack" "PHPUnit 12" "PHPUnit 11" "PHPUnit 10" "PHPUnit 9")
  local option
  select option in "${options[@]}"; do
    case $option in
      "Symfony Test Pack" )
        echo ""
        echo "Symfony Test Pack bundle will be used to install PHPUnit."
        echo "  Symfony determines which version will be installed."
        echo "  Symfony may or may not install the latest version of PHPUnit."
        echo "  Check composer.json after creating the project to see which version of PHPUnit is used."
        echo ""
        projectinit_phpunit_version="symfony/test-pack"
        break;;
      "PHPUnit 12")
        echo ""
        echo "PHPUnit 12 will be used"
        echo "  Release date: February 2025."
        echo "  End of bug fix support: February 2027."
        echo "  Requires PHP 8.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^12"
        break;;
      "PHPUnit 11" )
        echo ""
        echo "PHPUnit 11 will be used"
        echo "  Release date: February 2024."
        echo "  End of bugfix support: February 2026."
        echo "  Requires PHP 8.2 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^11"
        break;;
      "PHPUnit 10" )
        echo ""
        echo "PHPUnit 10 will be used"
        echo "  Release date: February 2023."
        echo "  End of bugfix support: February 2025."
        echo "  Requires PHP 8.1 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^10"
        break;;
      "PHPUnit 9" )
        echo ""
        echo "PHPUnit 9 will be used"
        echo "  Release date: February 2020."
        echo "  End of bugfix support: February 2024."
        echo "  Requires PHP 7.3 or higher"
        echo ""
        projectinit_phpunit_version="phpunit/phpunit:^9"
        break;;
    esac
  done

  local confirmation_options
  while true; do
    read -r -p "Are you sure (y/n)?" confirmation_options
    case "${confirmation_options,,}" in
      "y"|"yes"|"yup"|"yeah"|"1" ) break;;
      "n"|"no"|"nope"|"2" ) ask_phpunit_symfony; break;;
      * ) echo "Invalid input. Asking again..."
    esac
  done
}

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