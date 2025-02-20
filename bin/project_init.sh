#!/bin/bash

set -e
source ../src/new/git/git.sh
source ../src/new/filesystem/directory_management.sh
source ../src/new/info_print.sh

check_user_configuration

# Globals:
#   - project_root_dir
#   - tool_dir
ask_directories
# Globals:
#   - projectinit_create_project_root_directory
check_project_root_directory

# Globals:
#   - projectinit_git_user_name
#   - projectinit_git_user_email
ask_git_user_configuration
# Globals:
#   - projectinit_use_projectinit_gitignore
ask_gitignore_configuration
# Globals:
#   - ?projectinit_repo_url
check_git_directory

print_project_configuration

create_directories
configure_git_repository
configure_git_user
configure_gitignore
