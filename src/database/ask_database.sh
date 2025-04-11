#!/bin/bash

ask_database_engine() {
  echo ""
  echo "Database engine:"
  local options=("no database" "PostgreSQL" "MySQL" "Percona" "MariaDB" "MongoDB")
  local option
  select option in "${options[@]}"; do
    case $option in
      "no database" )
        projectinit_database_type="no database"
        break;;
      "PostgreSQL" )
        projectinit_database_type="pgsql"
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_database" )
        # shellcheck source=./pgsql/ask_pgsql.sh
        source "${tool_dir}/src/database/pgsql/ask_pgsql.sh"
        ask_pgsql_config
        break;;
      "MySQL" )
        projectinit_database_type="mysql"
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_database" )
        # shellcheck source=./mysql/ask_mysql.sh
        source "${tool_dir}/src/database/mysql/ask_mysql.sh"
        ask_mysql_config
        break;;
      "Percona" )
        projectinit_database_type="percona"
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_database" )
        # shellcheck source=./percona/ask_percona.sh
        source "${tool_dir}/src/database/percona/ask_percona.sh"
        ask_percona_config
        break;;
      "MariaDB" )
        projectinit_database_type="mariadb"
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_database" )
        # shellcheck source=./mariadb/ask_mariadb.sh
        source "${tool_dir}/src/database/mariadb/ask_mariadb.sh"
        ask_mariadb_config
        break;;
      "MongoDB" )
        projectinit_database_type="mongodb"
        projectinit_main_app_dependencies_list+=( "${projectinit_project_name}_database" )
        # shellcheck source=./mongodb/ask_mongodb.sh
        source "${tool_dir}/src/database/mongodb/ask_mongodb.sh"
        ask_mongodb_config
        break;;
    esac
  done
}