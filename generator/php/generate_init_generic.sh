# stop the script on any error
set -e
# run validators
if [ ! -f ../../config/params/git_user_configuration.sh ]; then
echo -e "\n../../config/params/git_user_configuration.sh not found. Run configure.sh to complete configuration."
    exit 1
fi
# prepare build destination file
BUILD_FILE="../../build/php/init_generic.sh"
mkdir -p ../../build/php
rm -rf ${BUILD_FILE}
touch ${BUILD_FILE}
# build script
cat "../../component/technical/stop_on_error.sh" >> "${BUILD_FILE}"
cat "../../component/helper/colors.sh" >> "${BUILD_FILE}"
## display software versions
echo -e "echo -e \"\${LIGHT_BLUE}\"" >> "${BUILD_FILE}"
cat "../../component/technical/init_directories.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/version_display/echo_php_version.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/version_display/echo_wget_version.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/version_display/echo_git_version.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
echo -e "echo -e \"\${NO_COLOR}\"" >> "${BUILD_FILE}"
## directory exists
cat "../../component/project/directory_exists.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## is git directory
cat "../../component/git/is_git_directory.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/technical/switch_to_project_dir.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## download phars
cat "../../component/phar/composer/download_latest.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/phar/php_cs_fixer/download_v3.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"

cat "../../component/phar/phpunit/download_v9.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## configure git user
cat "../../config/params/git_user_configuration.sh" >> "${BUILD_FILE}"

cat "../../component/git/user_configuration.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## configure .gitignore
cat "../../component/git/gitignore/generate_generic.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## initialize composer
cat "../../component/composer/init_composer.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## add PHP CS Fixer configuration
cat "../../component/phpcsfixer/v3/generate_generic.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## add PHPUnit configuration
cat "../../component/phpunit/v9/generate_generic.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## create base project base directories
cat "../../component/technical/create_project_base_directories.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
## wrapup
cat "../../component/technical/switch_to_tool_dir.sh" >> "${BUILD_FILE}"
cat "../../component/helper/draw_separator.sh" >> "${BUILD_FILE}"
