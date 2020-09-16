# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get -y update
sudo apt-get -y install neovim

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb\n

# Node js for neovim
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Ranger
sudo apt install -y  ranger
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
pip install ueberzug

pip install pynvim
pip install jedi

