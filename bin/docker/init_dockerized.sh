#!/bin/bash

set -e
source ../../src/colors_font_formatting.sh
source ../../src/git/git.sh
source ../../src/directory_management.sh
source ../../src/docker/common/language.sh
source ../../src/docker/common/properties.sh
source ../../src/docker/integrations/database/database.sh
source ../../src/docker/common/templates.sh
source ../../src/docker/common/installer.sh
source ../../src/docker/common/project.sh
source ../../src/php/project.sh

check_user_configuration
init_directories
setup_root_project_directory
draw_separator

# configure git
create_new_repo
setup_git_user_configuration
docker_configure_gitignore

# gather basic information
docker_pick_language
gather_service_properties
gather_database_properties
calculate_dependencies

# dockerized installer
copy_installer_templates
inject_installer_properties
build_installer
cleanup_installer
cleanup_installer_templates

# project setup
copy_project_templates
inject_project_service_properties
inject_database_properties
cleanup_project_templates
create_php_project_base_directories
docker_replace_gitignore_if_needed
build_project

echo "ProjectInit.sh completed setting up the project in ${project_root_dir}"