#!/bin/bash

run_ask_flow() {
  # shellcheck source=./container/container.sh
  source "${tool_dir}/src/new/container/container.sh"
  ask_to_use_container
  # shellcheck source=./language/language.sh
  source "${tool_dir}/src/new/language/language.sh"
  ask_language

  if [ ! "$projectinit_container_type" = "none" ]; then
    case "${projectinit_container_type}" in
      "docker" )
        # shellcheck source=./container/docker/docker.sh
        source "${tool_dir}/src/new/container/docker/docker.sh"
        ask_base_service_properties
        ;;
    esac

    # shellcheck source=./database/database.sh
    source "${tool_dir}/src/new/database/database.sh"
    ask_database_engine

    case "${projectinit_container_type}" in
    "docker" )
      calculate_app_service_dependencies
      ;;
    esac
  fi
}