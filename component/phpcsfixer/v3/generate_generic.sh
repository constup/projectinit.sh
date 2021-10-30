echo ""
echo "Checking .php-cs-fixer.dist.php in ${PROJECT_ROOT_DIR}..."
if [ ! -f "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php does not exist. Creating .php-cs-fixer.dist.php automatically..."
    echo -e "${NO_COLOR}"
    touch "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php"
    cat "${TOOL_DIR}/component/phpcsfixer/v3/generic.php-cs-fixer.dist.php" >> "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php"
else
    echo "${PROJECT_ROOT_DIR}/.php-cs-fixer.dist.php exists. Skipping automatic creation..."
fi
echo ".php-cs-fixer.dist.php setup completed"
