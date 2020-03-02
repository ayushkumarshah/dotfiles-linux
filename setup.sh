# Update sources
sudo apt-get update -y
sudo apt update -y

# Cleanup
sudo apt autoremove -y

# Install required apps
sudo apt install curl
sudo apt install -y git
sudo snap install vlc
sudo apt install -y python-pip
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y python3-tk
sudo apt install -y xclip
sudo apt install -y whois
sudo apt install -y anki
sudo apt install -y vim
sudo apt install -y gimp
sudo apt install -y htop
sudo apt install -y tmux
sudo apt install -y pavucontrol

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
sudo apt install -y ~/Downloads/google-chrome-stable_current_amd64.deb

# Install Build Essentials for PIP
sudo apt install -y build-essential libssl-dev libffi-dev python-dev
sudo apt install -y python3-venv
sudo apt install -y libkf5globalaccel-bin

# Install useful python libraries globally
pip3 install --user --upgrade pip3
pip3 install --user virtualenv
pip3 install --user requests
pip3 install --user bs4
pip3 install --user bpython
pip3 install --user pandas
pip3 install --user html5lib
pip3 install --user matplotlib

# Machine Learning Libraries
pip3 install --user tensorflow
pip3 install --user keras
pip3 install --user scikit-learn
pip3 install --user scikit-image
pip3 install --user seaborn
pip3 install --user sklearn
pip3 install --user numpy

# Install visual studio code
sudo snap install --classic code

# Remove default apps
sudo apt-get -y remove thunderbird
sudo apt-get -y remove pidgin
sudo apt-get -y remove banshee
sudo apt-get -y remove xchat
sudo apt-get -y remove tomboy
sudo apt-get -y remove xplayer

# Install Postman
sudo snap install postman

# Install Spotify
sudo snap install spotify

# Install todoist
sudo snap install todoist-thibaut

## Configurations
# Show more apps in the startup applications
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

# Install Miniconda 
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P ~/Downloads
chmod +x ~/Downloads/Miniconda3-latest-Linux-x86_64.sh
./Downloads/Miniconda3-latest-Linux-x86_64.sh 

# Install Pycharm Professional 
sudo snap install pycharm-professional --classic

# Install zoom
wget https://zoom.us/client/latest/zoom_amd64.deb -P ~/Downloads
sudo dpkg -i ~/Downloads/zoom_amd64.deb
sudo apt-get install -y -f

# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb -P ~/Downloads
sudo apt install -y ./Downloads/slack-desktop-*.deb

# Install AWS-CLI
sudo python -m pip install --upgrade awscli

# Install Dbeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update -y && sudo apt install -y dbeaver-ce

# Install Latex 
# sudo apt-get install -y texlive-full

# Install ohmyzsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Install powerline fonts for agnoster theme
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

# Ohmyzsh plugins
sudo apt install -y autojump
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Make symlinks for dotfiles
ln -svf ~/Desktop/dotfiles/linux/.zshrc ~
ln -svf ~/Desktop/dotfiles/linux/.config/* ~/config/
ln -svf ~/Desktop/dotfiles/linux/.fonts ~

# Install i3 window manager
sudo apt -y install i3

# Install packages for i3 

sudo apt-get install -y i3blocks # Status bar
sudo apt install -y feh # For images
sudo apt-get install -y i3lock-fancy # Lock screen

wget "https://github.com/haikarainen/light/releases/download/v1.2/light-1.2.tar.gz" -P ~/Downloads 
tar xf ~/Downloads/light-1.2.tar.gz -C ~/Downloads/
cd ~/Downloads/light-1.2 && ./configure && make 
sudo make install

# Player ctl for media controls
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/libplayerctl2_2.0.1-1_amd64.deb -P ~/Downloads 
wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/playerctl_2.0.1-1_amd64.deb -P ~/Downloads 
sudo apt install -y ./Downloads/playerctl_2.0.1-1_amd64.deb ./Downloads/libplayerctl2_2.0.1-1_amd64.deb

# Install rofi for i3wm
sudo apt install -y rofi

# Install arandr to manage multiple displays
sudo apt install -y arandr

# Remove dunst notifications and replace by normal notifications
sudo apt-get purge dunst

# Install nix and xidlehook for autolock
curl https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix-env --install xidlehook
chmod +x ~/.config/i3/autolock

conda install rise