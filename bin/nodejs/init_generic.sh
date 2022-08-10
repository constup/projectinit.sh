#!/bin/bash

set -e
source ../../src/git/git.sh
source ../../src/colors_font_formatting.sh
source ../../src/directory_management.sh
source ../../src/software/version_display.sh
source ../../src/nodejs/package_manager/nvm.sh
source ../../src/nodejs/node/node.sh
source ../../src/nodejs/project.sh

check_user_configuration
init_directories
setup_root_project_directory
draw_separator

# display software versions
nvm_version
draw_separator
node_version
draw_separator
npm_version
draw_separator
curl_version
draw_separator
git_version
draw_separator

# project root directory setup
draw_separator
is_git_directory
draw_separator
switch_to_project_dir

# configure git
setup_git_user_configuration
draw_separator

nodejs_new_or_existing_project
draw_separator

# wrapup
switch_to_tool_dir
draw_separator

echo "ProjectInit.sh completed setting up the project. Have fun!"
