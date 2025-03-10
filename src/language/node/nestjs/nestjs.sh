#!/bin/bash

ask_nestjs_version() {
  echo ""
  echo "Select NestJS version. Note: the latest minor version will be used."
  local options=("NestJS 11" "NestJS 10" "Custom")
  local option
  select option in "${options[@]}"; do
    case $option in
      "NestJS 11" )
        projectinit_nestjs_version="11.x"
        break;;
      "NestJS 10" )
        projectinit_nestjs_version="10.x"
        break;;
      "Custom" )
        echo ""
        echo "Manually enter your desired NestJS version (format: 10.4):"
        read -r -e projectinit_nestjs_version
        projectinit_nestjs_version="${projectinit_nestjs_version}"
        break;;
    esac
  done
}

ask_typescript_strict_mode() {
  echo ""
  echo "TypeScript strict mode (yes):"
  local options=("yes" "no")
  local option
  select option in "${options[@]}"; do
    case $option in
      "yes"|"" )
        projectinit_typescript_strict_mode=1
        break;;
      "no" )
        projectinit_typescript_strict_mode=0
    esac
  done
}