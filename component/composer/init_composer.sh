echo ""
echo "Initializing Composer..."
if [ ! -f "${PROJECT_ROOT_DIR}/composer.json" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "Composer is not initialized in your project's root directory. What do you want to do?"
    echo -e "${NO_COLOR}"
    component_composer_init_composer_options=("Initialize composer" "Exit this tool")
    select ccico in "${component_composer_init_composer_options[@]}"; do
        case $ccico in
            "Initialize composer" )
                php ./composer.phar init;
                php ./composer.phar install;
                break;;
            "Exit this tool" )
                exit 1;;
        esac
    done
else
    echo "composer.json exists in ${PROJECT_ROOT_DIR}. Installing..."
    php ./composer.phar install
    echo "Composer installation completed."
fi
echo "Composer initialized."
