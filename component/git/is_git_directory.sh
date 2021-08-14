echo ""
echo "Checking if your project root dir is a Git repository..."
if [ ! -d "${PROJECT_ROOT_DIR}/.git/" ]; then
    echo -e "${LIGHT_GREEN}"
    echo "Your project's root directory is not a Git repository. What do you want to do?"
    component_git_is_git_directory_options=("Clone an existing repository" "Create a new repository" "Exit this tool")
    select cgigdo in "${component_git_is_git_directory_options[@]}"; do
        case $cgigdo in
            "Clone an existing repository" )
                echo "Enter repository URL:";
                read PROJECT_REPO_URL;
                cd ${PROJECT_ROOT_DIR} && git clone ${PROJECT_REPO_URL} .;
                cd ${TOOL_DIR};
                break;;
            "Create a new repository" )
                cd ${PROJECT_ROOT_DIR} && git init;
                cd ${TOOL_DIR};
                break;;
            "Exit this tool" )
                exit 1;;
        esac
    done
    echo -e "${NO_COLOR}"
fi
echo "Your project root directory is a Git repository."
