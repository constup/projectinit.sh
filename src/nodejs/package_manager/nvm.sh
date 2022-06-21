#!/bin/bash

install_nvm_manual_git_bash() {
  echo "";
  echo "Installing the latest Node Version Manager (nvm)... Manual setup for Bash using git...";
  # Install nvm
  export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`) && \. "$NVM_DIR/nvm.sh";
  # Load nvm
  export NVM_DIR="$HOME/.nvm";
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";  # This loads nvm bash_completion
  # Add to .bashrc
  echo -e "export NVM_DIR=\"$HOME/.nvm\";\n" >> ~/.bashrc;
  echo -e "[ -s \"$NVM_DIR/nvm.sh\" ] && \\. \"$NVM_DIR/nvm.sh\";\n" >> ~/.bashrc;
  echo -e "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\";\n" >> ~/.bashrc;
}
