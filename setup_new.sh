# Install ohmyzsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Install powerline fonts for agnoster theme
git clone https://github.com/powerline/fonts.git
. ~/fonts/install.sh

# Ohmyzsh plugins
sudo apt install -y autojump
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Make symlinks for dotfiles
ln -svf ~/Desktop/dotfiles-linux/.zshrc ~
ln -svf ~/Desktop/dotfiles-linux/.config/* ~/.config/
ln -svf ~/Desktop/dotfiles-linux/.tmux/ ~/.tmux
ln -svf ~/Desktop/dotfiles-linux/.fonts ~

pip install pynvim==0.4.2 jedi==0.17.2

wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod u+x nvim.appimage
