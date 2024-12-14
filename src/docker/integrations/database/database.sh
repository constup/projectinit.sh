#!/bin/bash

pick_database_engine() {
  echo "Pick a database engine:"
  local selection=("No database" "PostgreSQL")
  local option
  select option in "${selection[@]}"; do
    case $option in
      "No database")
        PROJECTINIT_DOCKER_DATABASE_TYPE=""
        break;;
      "PostgreSQL")
        PROJECTINIT_DOCKER_DATABASE_TYPE="postgresql"
        PROJECTINIT_DOCKER_DATABASE_URL="https://hub.docker.com/_/postgres"
        break;;
    esac
  done
}

gather_database_properties() {
  if [ -n "$PROJECTINIT_DOCKER_DATABASE_TYPE" ]; then
    echo ""
    echo "Enter database Docker service name:"
    read -r -e PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME
    echo "Enter database host port:"
    read -r -e PROJECTINIT_DOCKER_DATABASE_HOST_PORT
    echo "Enter database version:"
    echo "To see the list of available database engine versions, visit $PROJECTINIT_DOCKER_DATABASE_URL"
    read -r -e PROJECTINIT_DOCKER_DATABASE_ENGINE_VERSION
    echo "Enter database username:"
    read -r -e PROJECTINIT_DOCKER_DATABASE_USERNAME
    echo "Enter database password:"
    read -r -e PROJECTINIT_DOCKER_DATABASE_PASSWORD
  fi
}

inject_database_properties() {
  echo ""
  echo "Injecting database properties..."
  if [ -n "$PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME" ]; then
    case $PROJECTINIT_DOCKER_DATABASE_TYPE in
      "postgresql" )
        echo "postgres in dockerfile..."
        perl -pi -e "s/#pdo_pgsql/pdo_pgsql/g" "${project_root_dir}/Dockerfile_dev"
        echo "removing mysql..."
        perl -i -ne 'print unless /#pdo_mysql/;' "${project_root_dir}/Dockerfile_dev"
        echo "database service in docker-compose.yml..."
        perl -i -pe "s/~~~database service~~~/$(<"${PROJECTINIT_DOCKER_TEMPLATE_DATABASE_DOCKER_COMPOSE}" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/docker-compose.yml" || exit 1
        echo "database initialization in startup script..."
        perl -i -pe "s/~~~database creation and migration~~~/$(<"${PROJECTINIT_DOCKER_TEMPLATE_DATABASE_STARTUP}" perl -pe 's/([\/\& \t])/\\$1/g')/g" "${project_root_dir}/start.sh" || exit 1
        echo "postgres version in docker-compose.yml"
        perl -pi -e "s/~~~database server version~~~/postgres:${PROJECTINIT_DOCKER_DATABASE_ENGINE_VERSION}/g" "${project_root_dir}/docker-compose.yml"
        echo "service dependency..."
        perl -i -pe "s/(.*depends_on:.*)/\1\n      - $PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME/" "${project_root_dir}/docker-compose.yml"
        ;;
    esac
    echo "database service name..."
    perl -pi -e "s/~~~database service name~~~/${PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME}/g" "${project_root_dir}/docker-compose.yml"
    echo "database container name..."
    perl -pi -e "s/~~~database container name~~~/${PROJECTINIT_DOCKER_DATABASE_SERVICE_NAME}/g" "${project_root_dir}/docker-compose.yml"
    echo "database user name..."
    perl -pi -e "s/~~~database user name~~~/${PROJECTINIT_DOCKER_DATABASE_USERNAME}/g" "${project_root_dir}/docker-compose.yml"
    echo "database password..."
    perl -pi -e "s/~~~database password~~~/${PROJECTINIT_DOCKER_DATABASE_PASSWORD}/g" "${project_root_dir}/docker-compose.yml"
    echo "database host port..."
    perl -pi -e "s/~~~database host port~~~/${PROJECTINIT_DOCKER_DATABASE_HOST_PORT}/g" "${project_root_dir}/docker-compose.yml"
    echo "Database properties are injected..."
  else
    echo "No database configured. Skipping..."
  fi
}