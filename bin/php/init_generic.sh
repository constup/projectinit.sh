#!/bin/bash

set -e
source ../../src/git/git.sh
source ../../src/colors_font_formatting.sh
source ../../src/directory_management.sh
source ../../src/software/version_display.sh
source ../../src/php/composer/composer.sh
source ../../src/php/phpcsfixer/php_cs_fixer.sh
source ../../src/php/phpunit/phpunit.sh
source ../../src/php/project.sh

check_user_configuration
init_directories
setup_root_project_directory
draw_separator

# display software versions
php_version
draw_separator
wget_version
draw_separator
git_version
draw_separator

# project root directory setup

draw_separator
is_git_directory
draw_separator
switch_to_project_dir

# download phars
download_latest_composer_phar
download_phpcsfixer_v3
download_phpunit_v9
draw_separator

# configure git
setup_git_user_configuration
generate_generic_gitignore_for_php
draw_separator

php_new_or_existing_project
draw_separator

# composer
init_composer_v2
draw_separator

# PHP CS Fixer configuration
generate_generic_phpcsfixer_v3
draw_separator

# PHPUnit configuration
generate_generic_phpunit_configuration_file_v9
draw_separator

# create project base directories
create_php_project_base_directories
draw_separator

# wrapup
switch_to_tool_dir
draw_separator

echo "ProjectInit.sh completed setting up the project. Have fun!"
