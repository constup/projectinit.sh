#!/bin/bash

run_ask_flow() {
  # shellcheck source=./container/container.sh
  source "${tool_dir}/src/new/container/container.sh"
  ask_to_use_container
  # shellcheck source=./language/language.sh
  source "${tool_dir}/src/new/language/language.sh"
  ask_language

  if [ ! "$projectinit_container_type" = "none" ]; then
    # shellcheck source=./database/database.sh
    source "${tool_dir}/src/new/database/database.sh"
    ask_database_engine
  fi
}