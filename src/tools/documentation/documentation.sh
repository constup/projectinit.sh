#!/bin/bash

setup_documentation() {
  if [ ! -d "${project_root_dir}/doc/projectinit" ]; then
    mkdir -p "${project_root_dir}/doc/projectinit"
  fi

  setup_database_documentation
}

setup_database_documentation() {
  case $projectinit_database_type in
    "pgsql" )
      cp -f "${tool_dir}/src/database/pgsql/container/docker/v1/template/documentation/index.adoc" "${project_root_dir}/doc/projectinit/postgresql.adoc"
      case $projectinit_container_type in
        "docker" )
          perl -pi -e "s/~~~implemented configuration~~~/$(<"${tool_dir}/src/database/pgsql/container/docker/v1/template/documentation/implemented_configuration.adoc" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/doc/projectinit/postgresql.adoc"
          ;;
      esac
      ;;
    "percona" )
      cp -f "${tool_dir}/src/database/percona/v1/template/documentation/index.adoc" "${project_root_dir}/doc/projectinit/percona_mysql.adoc"
      case $projectinit_container_type in
        "docker" )
          perl -pi -e "s/~~~implemented configuration~~~/$(<"${tool_dir}/src/database/percona/v1/template/documentation/docker/implemented_configuration.adoc" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/doc/projectinit/percona_mysql.adoc"
          ;;
      esac
      ;;
    "mariadb" )
      cp -f "${tool_dir}/src/database/mariadb/v1/template/documentation/index.adoc" "${project_root_dir}/doc/projectinit/mariadb.adoc"
      case $projectinit_container_type in
        "docker" )
          perl -pi -e "s/~~~implemented configuration~~~/$(<"${tool_dir}/src/database/mariadb/v1/template/documentation/docker/implemented_configuration.adoc" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/doc/projectinit/mariadb.adoc"
          ;;
      esac
      ;;
    "mysql" )
      cp -f "${tool_dir}/src/database/mysql/v1/template/documentation/index.adoc" "${project_root_dir}/doc/projectinit/mysql.adoc"
      case $projectinit_container_type in
        "docker" )
          perl -pi -e "s/~~~implemented configuration~~~/$(<"${tool_dir}/src/database/mysql/v1/template/documentation/docker/implemented_configuration.adoc" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/doc/projectinit/mysql.adoc"
          ;;
      esac
      ;;
  esac
}