echo ""
echo "Checking .php_cs.dist in ${PROJECT_ROOT_DIR}..."
if [ ! -f "${PROJECT_ROOT_DIR}/.php_cs.dist" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/.php_cs.dist does not exist. Creating .php_cs.dist automatically..."
    echo -e "${NO_COLOR}"
    touch "${PROJECT_ROOT_DIR}/.php_cs.dist"
    cat "${TOOL_DIR}/component/phpcsfixer/generic_php_cs.dist" >> "${PROJECT_ROOT_DIR}/.php_cs.dist"
else
    echo "${PROJECT_ROOT_DIR}/.php_cs.dist exists. Skipping automatic creation..."
fi
echo ".php_cs.dist setup completed"
