#!/bin/bash

#######################################
# Install the latest version of NVM by using Bash and Git. NVM will be installed in a default location - ~/.nvm
# Globals:
#   HOME - built-in variable (POSIX) pointing to user's home directory
#   nvm_dir - nvm installation directory
# Arguments:
#  None
#######################################
install_nvm_manual_git_bash() {
  echo "";
  echo "Installing the latest Node Version Manager (nvm)... Manual setup for Bash using git...";
  # Install nvm
  export nvm_dir="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$nvm_dir"
  cd "$nvm_dir"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`) && \. "$nvm_dir/nvm.sh";
  # Load nvm
  export nvm_dir="$HOME/.nvm";
  [ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"; # This loads nvm
  [ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion";  # This loads nvm bash_completion
  # Add to .bashrc
  echo -e "export NVM_DIR=\"$HOME/.nvm\";\n" >> ~/.bashrc;
  echo -e "[ -s \"$nvm_dir/nvm.sh\" ] && \\. \"$nvm_dir/nvm.sh\";\n" >> ~/.bashrc;
  echo -e "[ -s \"$nvm_dir/bash_completion\" ] && \. \"$nvm_dir/bash_completion\";\n" >> ~/.bashrc;
}
