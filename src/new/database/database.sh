#!/bin/bash

ask_database_engine() {
  echo ""
  echo "Database engine:"
  local options=("no database" "PostgreSQL")
  local option
  select option in "${options[@]}"; do
    case $option in
      "no database" )
        projectinit_database_type="no database"
        break;;
      "PostgreSQL" )
        projectinit_database_type="pgsql"
        # shellcheck source=./pgsql.sh
        source "${tool_dir}/src/new/database/pgsql.sh"
        ask_pgsql_config
        break;;
    esac
  done
}