# The configuration for my linux

<!-- ## First, change bash to zsh (Linux) --> 
<!-- ``` -->
<!-- sudo apt install -y zsh -->
<!-- chsh -s $(which zsh) -->
<!-- ``` -->
<!-- ## Logout and login, then run setup.sh -->
<!-- ``` -->
<!-- chmod +x ~/Desktop/dotfiles-linux/setup.sh -->
<!-- . ~/Desktop/dotfiles-linux/setup.sh -->
<!-- ``` -->

<!-- ## Repeated steps -->
<!-- [Add ssh key to github](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) -->

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
### Install tmux plugins

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Press prefix + I (capital i, as in Install) to fetch the plugin.

## Install miniconda
```zsh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
```

## Neovim
### Updated (latest version) - install from source

Check [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source)

```bash
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.10.0
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

**Update Node**
```bash
sudo n 22.0.0
```

#### Add copilot
```vim
:Copolot setup
```

### Old
- Download stable nvim.appimage (0.6.1) from github releases:
```  
mkdir ~/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage ~/Downloads/
chmod u+x nvim.appimage

# OR
cp nvim.appimage ~/Downloads/


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
- Run :CocInstall coc-pyright
- Run `sh .config/nvim/scripts/install_coc_extensions.sh`

## Softwares

### General
* Chrome
* [Spotify](http://www.spotify.com/download?_ga=2.119251337.1285576053.1579697598-1908647167.1579697598)
* [Foxit PDF Reader](https://www.foxitsoftware.com/pdf-reader/)
* Todoist

### Work
* Pycharm
* [Anaconda](https://www.anaconda.com/distribution/#download-section) OR
* [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
  After installation, run this command in terminal
  ```
  conda config --set auto_activate_base False
  ```
* [Zoom](https://zoom.us/download)
* Slack
* [Postman](https://www.getpostman.com/downloads/)
* [VS Code](https://code.visualstudio.com/download)
* [Dbeaver](https://dbeaver.io/download/)
* [Gcloud](https://cloud.google.com/sdk/install#installation_options)
  
Add this at end of /etc/fstab  to mount windows automatically at startup */
```
/dev/disk/by-uuid/14821D20821D07BE /media/ayush/NewVolume auto nosuid,nodev,nofail,x-gvfs-show 
```

Configure keystore for chrome and nautilus: 
https://www.linuxquestions.org/questions/linux-desktop-74/openbox-autostart-gnome-keyring-daemon-message-4175547333/
