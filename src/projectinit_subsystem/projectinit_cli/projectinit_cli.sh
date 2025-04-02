#!/bin/bash

generate_base_projectinit_cli() {
  local target_file
  target_file="${project_root_dir}/projectinit_cli.sh"
  local projectinit_version
  projectinit_version=$(cat "${tool_dir}/version")

  cp -f "${tool_dir}/src/projectinit_subsystem/projectinit_cli/include/projectinit_base.sh" "${target_file}"
  perl -pi -e "s/~~~projectinit version~~~/${projectinit_version}/g" "${target_file}"
}

cleanup_projectinit_cli() {
  local target_file
  target_file="${project_root_dir}/projectinit_cli.sh"

  perl -i -ne 'print unless /~~~include file~~~/;' "${target_file}"
  perl -i -ne 'print unless /~~~help for feature~~~/;' "${target_file}"
}