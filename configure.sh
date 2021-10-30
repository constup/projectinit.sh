echo ""
echo "Warning: Running this script will overwrite your previous configuration, if you have configured ProjectInit.sh in the past."
echo "What would you like to do?"
configuration_script_options=("Configure ProjectInit.sh" "Exit")
select cso in "${configuration_script_options[@]}"; do
  case $cso in
    "Configure ProjectInit.sh" )
      echo "Git username:"
      read CONFIGURATION_GIT_USER_NAME
      echo "Git user email:"
      read CONFIGURATION_GIT_USER_EMAIL
      rm ./config/params/git_user_configuration.sh
      echo "GIT_USER_NAME=\"${CONFIGURATION_GIT_USER_NAME}\"" >> ./config/params/git_user_configuration.sh
      echo "GIT_USER_EMAIL=\"${CONFIGURATION_GIT_USER_EMAIL}\"" >> ./config/params/git_user_configuration.sh
      echo
      break;;
    "Exit" )
      exit 1;;
  esac
done
echo "Configuration completed."
