echo ""
echo "Checking phpunit.xml.dist in ${PROJECT_ROOT_DIR}..."
if [ ! -f "${PROJECT_ROOT_DIR}/phpunit.xml.dist" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/phpunit.xml.dist does not exist. Creating phpunit.xml.dist automatically..."
    echo -e ${NO_COLOR}
    touch "${PROJECT_ROOT_DIR}/phpunit.xml.dist"
    cat "${TOOL_DIR}/component/phpunit/v9/generic.phpunit.xml.dist" >> "${PROJECT_ROOT_DIR}/phpunit.xml.dist"
else
    echo "${PROJECT_ROOT_DIR}/phpunit.xml.dist exists. Skipping automatic creation..."
fi
echo "phpunit.xml.dist setup completed."
