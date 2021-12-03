#!/bin/bash

echo ""
echo "Warning: Running this script will overwrite your previous configuration, if you have configured ProjectInit.sh in the past."
echo "What would you like to do?"
configuration_script_options=("Configure ProjectInit.sh" "Exit")
select cso in "${configuration_script_options[@]}"; do
  case $cso in
    "Configure ProjectInit.sh" )
      echo "Git username:"
      read -r GIT_USER_NAME
      echo "Git user email:"
      read -r GIT_USER_EMAIL
      rm  -rf ./config/params/git_user_configuration.sh
      mkdir -p ./config/params
      touch ./config/params/git_user_configuration.sh
      echo "#!/bin/bash" >> ./config/params/git_user_configuration.sh
      echo "" >> ./config/params/git_user_configuration.sh
      echo "GIT_USER_NAME=\"${GIT_USER_NAME}\"" >> ./config/params/git_user_configuration.sh
      echo "GIT_USER_EMAIL=\"${GIT_USER_EMAIL}\"" >> ./config/params/git_user_configuration.sh
      echo
      break;;
    "Exit" )
      exit 1;;
  esac
done
echo "Configuration completed."
