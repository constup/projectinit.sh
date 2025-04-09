#!/bin/bash

print_phpunit_info_print() {
  # shellcheck source=../../../../../../general.sh
  source "${tool_dir}/src/general.sh"

  if in_array "phpunit" "${projectinit_libraries_list[@]}"; then
    echo "| PHP Unit"
    echo "|------------------------------"
    echo "| PHP Unit version: ${projectinit_phpunit_version}"
    # we don't know which version Symfony test pack is using
      if [ ! "$projectinit_phpunit_version" = "symfony/test-pack" ]; then
        if [ "$projectinit_use_projectinit_phpunit_dist" -eq 0 ]; then
          echo "| Configuration: Default phpunit.dist.xml is used"
        else
          echo "| Configuration: ProjectInit's phpunit.dist.xml is used"
        fi
      else
        echo "| Configuration: Symfony Test Pack was used. Configure phpunit.dist.xml manually"
      fi
    echo "|------------------------------"
  fi
}