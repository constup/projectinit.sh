#!/bin/bash

set -e
source ../src/new/git/git.sh
source ../src/new/filesystem/directory_management.sh
source ../src/new/info_print.sh
source ../src/new/container/container.sh
source ../src/new/language/language.sh
source ../src/new/language/flow.sh

check_user_configuration

# Directory setup
ask_directories
check_project_root_directory
#---

# Git setup
ask_git_user_configuration
ask_gitignore_configuration
#---

ask_to_use_container
ask_language

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