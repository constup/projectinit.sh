#!/bin/bash

echo ""
echo "Warning: Running this script will overwrite your previous configuration, if you have configured ProjectInit.sh in the past."
echo "What would you like to do?"
configuration_script_options=("Configure ProjectInit.sh" "Exit")
select cso in "${configuration_script_options[@]}"; do
  case $cso in
    "Configure ProjectInit.sh" )
      echo "Git username:"
      read -r git_user_name
      echo "Git user email:"
      read -r git_user_email
      rm -rf ./config/params/git_user_configuration.sh
      mkdir -p ./config/params
      touch ./config/params/git_user_configuration.sh
      echo "#!/bin/bash" >> ./config/params/git_user_configuration.sh
      echo "" >> ./config/params/git_user_configuration.sh
      echo "GIT_USER_NAME=\"${git_user_name}\"" >> ./config/params/git_user_configuration.sh
      echo "GIT_USER_EMAIL=\"${git_user_email}\"" >> ./config/params/git_user_configuration.sh
      echo
      break;;
    "Exit" )
      exit 1;;
  esac
done
echo "Configuration completed."
