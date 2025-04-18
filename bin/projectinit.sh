#!/bin/bash

set -Eeuo pipefail
trap 'echo "Error in $0 at line $LINENO: command \"$BASH_COMMAND\" exited with status $?"' ERR

source ../src/git/git.sh
source ../src/filesystem/directory_management.sh
source ../src/projectinit_subsystem/info_print/info_print.sh
source ../src/language/flow.sh
source ../src/language/ask_flow.sh
source ../src/projectinit_subsystem/documentation/documentation.sh
source ../src/projectinit_subsystem/projectinit_cli/projectinit_cli.sh

cat << "EOF"
    ____               _           __  ____      _ __         __
   / __ \_________    (_)__  _____/ /_/  _/___  (_) /_  _____/ /_
  / /_/ / ___/ __ \  / / _ \/ ___/ __// // __ \/ / __/ / ___/ __ \
 / ____/ /  / /_/ / / /  __/ /__/ /__/ // / / / / /__ (__  ) / / /
/_/   /_/   \____/_/ /\___/\___/\__/___/_/ /_/_/\__(_)____/_/ /_/
                /___/
EOF
cat ../version
echo ""

check_user_configuration

# Directory setup
ask_directories
check_project_root_directory
echo ""
echo "Project name (in lower_snake_case_format):"
echo "NOTE: This project name will be used as a base for creating several configuration options for your project, including names of Docker Compose services."
read -r -e projectinit_project_name
#---

# Git setup
ask_git_user_configuration
ask_gitignore_configuration
ask_gitattributes_configuration
#---

run_ask_flow
init_globals_before_starting_flow
print_project_configuration
ask_generate_project_id_card_text

# Directory setup
create_directories
#---

# Git setup
configure_git_repository
configure_git_user
configure_gitattributes
#---

generate_base_projectinit_cli
run_flow
cleanup_projectinit_cli
setup_documentation
generate_project_id_card_text

echo ""
echo "-------------------------------------------------"
echo "ProjectInit completed setting up your project at: ${project_root_dir}"
echo "Take a look at ${project_root_dir}/doc/projectinit/index.adoc for more info and maintenance instructions."
if [ "${projectinit_generate_id_card_text}" = 1 ]; then
  echo "Text version of the Project ID card is available at ${project_root_dir}/projectinit_id_card.txt"
fi
echo "-------------------------------------------------"
echo ""