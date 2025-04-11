#!/bin/bash

init_integrations() {
  declare -a projectinit_tools_list=()
  declare -a projectinit_main_app_dependencies_list=()
  declare -a projectinit_libraries_list=()
}

run_service_integrations() {
  if [[ -v projectinit_tools_list ]]; then
    echo "  Running service integrations..."
    local integrations_type
    integrations_type="$1"

    # shellcheck source=../../general.sh
    source "${tool_dir}/src/general.sh"

    if in_array "memcached" "${projectinit_tools_list[@]}"; then
      echo "    Integrating Memcached..."
      # shellcheck source=../../tools/cache/memcached/container/docker/v1/memcached.sh
      source "${tool_dir}/src/tools/cache/memcached/container/docker/v1/memcached.sh"
      case $integrations_type in
        "dev" ) run_memcached_integration_dev; ;;
        "prod" ) run_memcached_integration_prod; ;;
        "installer" ) ;;
      esac
    fi
  else
    echo "  No additional services are configured..."
  fi
}

run_library_integrations() {
  if [[ -v projectinit_libraries_list ]]; then
    echo "  Running library integrations..."
    local library
    library="$1"

    # shellcheck source=../../general.sh
    source "${tool_dir}/src/general.sh"

    if in_array "phpunit" "${projectinit_libraries_list[@]}"; then
      echo "    Integrating PHP Unit..."
      # shellcheck source=../../libraries/testing_internal/php/php_unit/phpunit.sh
      source "${tool_dir}/src/libraries/testing_internal/php/php_unit/phpunit.sh"
      case $library in
        "dev" ) run_phpunit_integration_dev; ;;
        "prod" ) ;;
        "installer" ) run_phpunit_integration_installer; ;;
      esac
      echo "      Integration completed..."
    fi

    if in_array "php_cs_fixer" "${projectinit_libraries_list[@]}"; then
      echo "    Integrating PHP CS Fixer..."
      # shellcheck source=../../libraries/linters_analyzers_fixers/php/php_cs_fixer/php_cs_fixer.sh
      source "${tool_dir}/src/libraries/linters_analyzers_fixers/php/php_cs_fixer/php_cs_fixer.sh"
      case $library in
        "dev" ) run_php_cs_fixer_integration_dev; ;;
        "prod" ) ;;
        "installer" ) run_php_cs_fixer_integration_installer; ;;
      esac
      echo "      Integration completed..."
    fi
  else
    echo "  No additional libraries are configured..."
  fi
}