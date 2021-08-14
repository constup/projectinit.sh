echo ""
echo "Checking if ${PROJECT_ROOT_DIR}/src source directory exists..."
if [ ! -d "${PROJECT_ROOT_DIR}/src" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/src/ does not exist. Creating src directory automatically..."
    echo -e "${NO_COLOR}"
    mkdir ${PROJECT_ROOT_DIR}/src
else
    echo "${PROJECT_ROOT_DIR}/src directory exists. Skipping..."
fi
echo ""
echo "Checking if ${PROJECT_ROOT_DIR}/tests source directory exists..."
if [ ! -d "${PROJECT_ROOT_DIR}/tests" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "${PROJECT_ROOT_DIR}/tests/ does not exist. Creating tests directory automatically..."
    echo -e "${NO_COLOR}"
    mkdir ${PROJECT_ROOT_DIR}/tests
else
    echo "${PROJECT_ROOT_DIR}/tests directory exists. Skipping..."
fi
