#!/bin/bash

set -e
source ../src/git/git.sh
source ../src/filesystem/directory_management.sh
source ../src/info_print.sh
source ../src/language/flow.sh
source ../src/language/ask_flow.sh

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

run_flow
generate_project_id_card_text

echo ""
echo "-------------------------------------------------"
echo "ProjectInit completed setting up your project at: ${project_root_dir}"
echo "Take a look at ${project_root_dir}/PROJECTINIT_README.adoc for more info and maintenance instructions."
if [ "${projectinit_generate_id_card_text}" = 1 ]; then
  echo "Text version of the Project ID card is available at ${project_root_dir}/projectinit_id_card.txt"
fi
echo "-------------------------------------------------"
echo ""