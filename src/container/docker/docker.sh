#!/bin/bash

ask_base_service_properties() {
  echo "Docker application service properties:"
  case $projectinit_language in
    "php" )
      echo "  PHP version:"
      ;;
    "node" )
      echo "  Node version:"
      ;;
  esac
  read -r -e projectinit_language_version
  echo "  Application host port:"
  read -r -e projectinit_app_host_port
}

cleanup_docker_compose() {
  local target_file="$1"

  if [ "${projectinit_compose_has_secrets}" -eq 1 ]; then
    perl -pi -e "s/~~~secrets~~~/secrets:/g" "${target_file}"
  else
    perl -i -ne 'print unless /~~~secrets~~~/;' "${target_file}"
  fi

  if [[ ! -v projectinit_main_app_dependencies_list ]]; then
    perl -i -ne 'print unless /~~~main application dependencies~~~/;' "${target_file}"
  else
    perl -pi -e "s/~~~main application dependencies~~~/depends_on:/g"  "${target_file}"
  fi

  if [ "${projectinit_compose_has_root_volumes}" = 1 ]; then
    perl -pi -e "s/~~~root volumes~~~/volumes:/g" "${target_file}"
  else
    perl -i -ne 'print unless /~~~root volumes~~~/;' "${target_file}"
  fi

  perl -i -ne 'print unless /~~~container services~~~/;' "${target_file}"
}