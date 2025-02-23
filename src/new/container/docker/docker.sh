#!/bin/bash

ask_base_service_properties() {
  echo "Application Docker service properties:"
  echo "  Docker service name:"
  read -r -e projectinit_app_service_name
  echo "  Application host port:"
  read -r -e projectinit_app_host_port
}