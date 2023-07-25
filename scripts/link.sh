#!/usr/bin/env zsh

# Create Symlinks
link_to() {
    if [ ! -e "$1" ]; then
        printf "\nWARNING: cannot link $1 because it does not exist\n"
    else
        mkdir -p "$(dirname "$2")"
        ln -sf "$1" "$2"
        printf "\n$2 Linked to $1 \n\n"
    fi
}
link_dotfile() {
    link_to $(pwd)/$1 ~/$1
}

# Link config files
link_dotfile .zshrc
link_dotfile .bash_profile
link_dotfile .gitconfig
link_dotfile .tmux.conf
link_dotfile .vimrc
link_dotfile .Brewfile
link_dotfile com.googlecode.iterm2.plist
ln -svf $(pwd)/.config/ ~
ln -svf $(pwd)/scripts/ ~
