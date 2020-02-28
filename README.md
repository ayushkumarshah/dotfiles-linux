# The configuration for my linux

## First, change bash to zsh (Linux) 
```
sudo apt install -y zsh
chsh -s $(which zsh)
```
## Logout and login, then run setup.sh
```
ln -svf ~/Desktop/dotfiles-linux/setup.sh ~
chmod +x setup.sh
./setup.sh
```

## Repeated steps
[Add ssh key to github](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

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
