# Linux Setup (After installation)

## Install zsh and change to default

```zsh
sudo apt install zsh xsel xclip tmux
chsh -s $(which zsh)
```

## Generate ssh key and link to github

```zsh
ssh-keygen -t rsa -b 4096 -C "ayusk.kumar.shah@gmail.com"
eval "$(ssh-agent -s)"
vim ~/.ssh/config
```

Add these lines:
```
Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

```zsh
ssh-add ~/.ssh/id_rsa
```

### Add the key to github

```zsh
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

cat ~/.ssh/id_rsa.pub | pbcopy
pbpaste
# Then paste to github
```

## Install ohmyzsh
```zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
```

## Install powerline fonts for agnoster theme

```zsh
git clone https://github.com/powerline/fonts.git ~/fonts
. ~/fonts/install.sh
```

## Ohmyzsh plugins

```zsh
sudo apt install -y autojump
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Set up dotfiles

```zsh
git clone git@github.com:ayushkumarshah/dotfiles-linux.git
```

### Make symlinks for dotfiles
- Run the ln commands from setup.sh
 
 ```zsh
  ln -svf ~/dotfiles-linux/.zshrc ~
  ln -svf ~/dotfiles-linux/.config/* ~/.config/
  ln -svf ~/dotfiles-linux/.tmux/ ~/.tmux
  ln -svf ~/dotfiles-linux/.tmux/tmux.conf ~/.tmux.conf
  cp ~/dotfiles-linux/.fonts/* ~/.fonts/
 ```

## Install miniconda
```zsh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
```

## Neovim

- Download stable nvim.appimage (0.6.1) from github releases:
```  
wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod u+x nvim.appimage
```

- Set alias of vim and nvim to nvim.appimage (Already done in dotfiles above)

### Set up neovim dependencies

- Run nvim-dependencies.sh
  - Installs fzf, ripgrep, ranger
  - For Mac: 
    - `brew install fzf ranger ripgrep`
    - `$(brew --prefix)/opt/fzf/inst`

  - Install python packages
    ```
    conda activate base
    pip install pynvim==0.4.2 jedi==0.17.2
    ```

- For luavim language server:
  * sudo npm i -g pyright bash-language-server
  * If doesn't work, comment all lua in init.vim, plugins nvim-lspconfig
      (already done)
- Run :CocInstall coc-python coc-pyright
- Run `sh .config/nvim/scripts/install_coc_extensions.sh`
