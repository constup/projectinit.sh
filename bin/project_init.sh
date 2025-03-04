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
#---

# Git setup
ask_git_user_configuration
ask_gitignore_configuration
#---

run_ask_flow

print_project_configuration

# Directory setup
create_directories
#---

# Git setup
configure_git_repository
configure_git_user
configure_gitignore
#---

run_flow

echo ""
echo "-------------------------------------------------"
echo "ProjectInit completed setting up your project at: ${project_root_dir}"
echo "Take a look at ${project_root_dir}/PROJECTINIT_README.adoc for more info and maintenance instructions."
echo "-------------------------------------------------"
echo ""