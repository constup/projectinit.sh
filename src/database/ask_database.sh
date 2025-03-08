#!/bin/bash

ask_database_engine() {
  echo ""
  echo "Database engine:"
  local options=("no database" "PostgreSQL" "MySQL" "Percona" "MariaDB")
  local option
  select option in "${options[@]}"; do
    case $option in
      "no database" )
        projectinit_database_type="no database"
        break;;
      "PostgreSQL" )
        projectinit_database_type="pgsql"
        # shellcheck source=./pgsql/ask_pgsql.sh
        source "${tool_dir}/src/database/pgsql/ask_pgsql.sh"
        ask_pgsql_config
        break;;
      "MySQL" )
        projectinit_database_type="mysql"
        # shellcheck source=./mysql/ask_mysql.sh
        source "${tool_dir}/src/database/mysql/ask_mysql.sh"
        ask_mysql_config
        break;;
      "Percona" )
        projectinit_database_type="percona"
        # shellcheck source=./percona/ask_percona.sh
        source "${tool_dir}/src/database/percona/ask_percona.sh"
        ask_percona_config
        break;;
      "MariaDB" )
        projectinit_database_type="mariadb"
        # shellcheck source=./mariadb/ask_mariadb.sh
        source "${tool_dir}/src/database/mariadb/ask_mariadb.sh"
        ask_mariadb_config
        break;;
    esac
  done
}