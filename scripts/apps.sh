#!/usr/bin/env zsh

# AWS
# curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "~/Downloads/awscli-bundle.zip"
# unzip awscli-bundle.zip
# sudo . ~/Downloads/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
