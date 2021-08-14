echo ""
echo "Checking .gitignore in ${PROJECT_ROOT_DIR}..."
if [ ! -f "${PROJECT_ROOT_DIR}/.gitignore" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/.gitignore does not exist. Creating .gitignore automatically..."
    echo -e "${NO_COLOR}"
    touch "${PROJECT_ROOT_DIR}/.gitignore"
    cat "${TOOL_DIR}/component/git/gitignore/generic.gitignore" >> "${PROJECT_ROOT_DIR}/.gitignore"
else
    echo "${PROJECT_ROOT_DIR}/.gitignore exists. Skipping automatic creation..."
fi
echo ".gitignore setup completed."
