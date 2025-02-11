#!/bin/bash

gather_service_properties() {
  echo ""
  echo "Enter your project's Docker service name (lowercase letters and underscores only):"
  read -r -e PROJECTINIT_DOCKER_PROJECT_SERVICE_NAME
  echo "Enter application host port:"
  read -r -e PROJECTINIT_DOCKER_APP_HOST_PORT
}