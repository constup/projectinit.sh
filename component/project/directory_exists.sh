echo ""
echo "Checking if your project root directory exists..."
if [ ! -d ${PROJECT_ROOT_DIR} ]; then
    echo -e "${LIGHT_GREEN}"
    echo "Your project directory doesn't exist. What do you want to do?"
    component_project_directory_exists_options=("Create directory" "Exit this tool")
    select cpdeo in "${component_project_directory_exists_options[@]}"; do
        case $cpdeo in
            "Create directory" )
                mkdir -p ${PROJECT_ROOT_DIR};
                echo -e "\nDirectory created.\n";
                break;;
            "Exit this tool" )
                exit 1;;
        esac
    done
    echo -e "${NO_COLOR}"
fi
echo "Project directory is available."
